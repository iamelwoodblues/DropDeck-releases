#!/bin/bash
# Fetches libprojectM 4.1.8, applies the DropDeck patch (render-to-FBO, external frame
# time, feedback seeding/drawing, motion speed, thread-local eval RNG) and installs a shared library into third_party/projectm-install.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TP="$ROOT/third_party"
SRC="$TP/projectm"
BUILD="$TP/build-projectm"
PREFIX="$TP/projectm-install"
TAG="v4.1.8"
PATCH="$ROOT/patches/projectm-4.1.8-dropdeck.patch"

command -v cmake >/dev/null || { echo "cmake is required: brew install cmake" >&2; exit 1; }
mkdir -p "$TP"

if [ ! -d "$SRC/.git" ]; then
    git clone --depth 1 --branch "$TAG" --recurse-submodules --shallow-submodules \
        https://github.com/projectM-visualizer/projectm.git "$SRC"
fi

# Apply the patch once (skipped when it is already applied). An older DropDeck patch is
# replaced: the checkout is reset to the release first.
MARKER=projectm_set_motion_speed
MARKER_FILE="$SRC/src/api/include/projectM-4/parameters.h"
if ! grep -q "$MARKER" "$MARKER_FILE"; then
    if grep -q projectm_opengl_render_frame_fbo "$SRC/src/api/include/projectM-4/render_opengl.h"; then
        echo "Replacing an older DropDeck patch"
        git -C "$SRC" checkout -- .
        git -C "$SRC/vendor/projectm-eval" checkout -- .
    fi
    patch -d "$SRC" -p1 --forward < "$PATCH"
    echo "Applied $(basename "$PATCH")"
fi
grep -q "$MARKER" "$MARKER_FILE" \
    || { echo "projectM patch is not applied" >&2; exit 1; }

cmake -S "$SRC" -B "$BUILD" \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_SYSTEM_PROJECTM_EVAL=OFF \
    -DENABLE_PLAYLIST=OFF \
    -DENABLE_SDL_UI=OFF \
    -DBUILD_TESTING=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_DEBUG_POSTFIX=OFF \
    -DCMAKE_OSX_ARCHITECTURES=arm64 \
    -DCMAKE_OSX_DEPLOYMENT_TARGET=13.0 \
    -DCMAKE_INSTALL_PREFIX="$PREFIX" \
    -DCMAKE_INSTALL_NAME_DIR=@rpath
cmake --build "$BUILD" -j "$(sysctl -n hw.ncpu)"
cmake --install "$BUILD"
shasum "$PATCH" | cut -d' ' -f1 > "$PREFIX/.patch-sha"
echo "libprojectM installed to $PREFIX/lib"
