# =====================================================================
#  Step 7: save and export  (run after any movie step)
#      @steps/07_export.pml
# ---------------------------------------------------------------------
#  Three things you can save, from most to least useful:
#
#  1. The SESSION (.pse). Keeps every object, scene, keyframe and mdo
#     command. You can open it next week and change the movie.
#     Always save this first.
#
#  2. The MOVIE FILE (.mpg / .mp4). What you show people.
#
#  3. PNG FRAMES. One picture per frame. Works in every PyMOL.
#
#  Rendering takes a while: ray tracing 1280 x 720 can take about a
#  second per frame, so a 40 s movie (1200 frames) takes about 20 min.
#  Test with a small, fast version first.
# =====================================================================

# ---- 1. save the session ----------------------------------------------
save my_movie.pse

# ---- 2a. a quick test render (fast and small) ----------------------------
# "draw" mode films the screen as you see it: fast but rougher edges.
# Licensed PyMOL (Schrodinger / educational):
#   movie.produce("test.mpg", mode="draw", quality=60, width=640, height=360)

# ---- 2b. the final movie ----------------------------------------------------
# "ray" mode ray traces every frame: slow but clean.
# Licensed PyMOL writes .mpg (MPEG-1) out of the box:
#   movie.produce("my_movie.mpg", mode="ray", quality=90, width=1280, height=720)
# Same thing from the menus: File > Export Movie As > MPEG
#
# .mp4 or .mov need the program ffmpeg. If PyMOL says
#   neither "ffmpeg" nor "convert" available
# then ffmpeg is not installed. Use .mpg, or the PNG route below.
# VLC plays .mpg files on any computer.

# ---- 3. PNG frames (works in open-source PyMOL too) ----------------------------
# Make a folder called frames first, then:
#   set ray_trace_frames, 1
#   viewport 1280, 720
#   mpng frames/frame_
# This writes frames/frame_0001.png, frame_0002.png ...
# Turn them into a movie with any image-sequence tool, for example
# Fiji/ImageJ: File > Import > Image Sequence, then File > Save As > AVI.
#
# A single still for a slide or poster:
#   scene 07_catalytic_triad
#   png triad.png, width=2400, height=1350, dpi=300, ray=1
