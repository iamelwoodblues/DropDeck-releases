# DropDeck's changes to projectM

DropDeck uses [libprojectM](https://github.com/projectM-visualizer/projectm) 4.1.8 with these
changes:

- rendering into a caller-supplied framebuffer
- an externally controlled frame clock (for the speed control)
- `projectm_opengl_draw_initial_image`: seeds a preset with a picture (for Morph and seamless
  resolution changes)
- `projectm_opengl_feedback_texture`: exposes the preset's feedback image, so pads and Melt
  overlays can be drawn into it
- `projectm_set_motion_speed`: scales per-frame warp motion and decay (the speed control)
- a thread-local random generator in the expression evaluator, so two instances can run side by
  side

Files here:

- `projectm-4.1.8-dropdeck.patch`: the changes, against projectM's `v4.1.8` tag.
- `build-projectm.sh`: fetches projectM 4.1.8, applies the patch and builds the library, as
  DropDeck's build does.

The complete patched source is also attached to each release as
`projectm-4.1.8-dropdeck-source.tar.gz`. projectM is licensed under the LGPL-2.1: see
[`../LICENSES/projectM-LGPL-2.1.txt`](../LICENSES/projectM-LGPL-2.1.txt).
