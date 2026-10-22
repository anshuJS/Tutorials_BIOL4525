# =====================================================================
#  Step 4: a movie made of scenes  (run steps 1 and 2 first)
#      @steps/04_scene_movie.pml
# ---------------------------------------------------------------------
#  The original video was made by clicking from scene to scene while a
#  screen recorder ran. PyMOL can do the clicking for you and fly the
#  camera smoothly between scenes.
#
#  KEYFRAMES: you only tell PyMOL what happens at a few frames.
#  PyMOL fills in the camera motion for the frames in between.
#
#     mview store, FRAME, scene=NAME
#        at FRAME, show scene NAME and remember its camera
#
#  Two keyframes with the SAME scene = the camera holds still
#  (time to read). Two keyframes with DIFFERENT scenes = the camera flies.
#  Representations switch at the keyframe and do not fade.
#  (Step 5 shows how to fade.)
#
#  Timing used here, at 30 frames per second:
#     hold a scene   about 2.5 s  =  75 frames
#     fly to next    about 2 s    =  60 frames
# =====================================================================

set movie_fps, 30
mset 1 x1290

mview store,    1, scene=01_enzyme
mview store,   75, scene=01_enzyme

mview store,  135, scene=03_buried_substrate
mview store,  210, scene=03_buried_substrate

mview store,  270, scene=04_gorge_cut
mview store,  345, scene=04_gorge_cut

mview store,  405, scene=05_cartoon
mview store,  465, scene=05_cartoon

mview store,  525, scene=06_aromatic_gorge
mview store,  615, scene=06_aromatic_gorge

mview store,  675, scene=07_catalytic_triad
mview store,  765, scene=07_catalytic_triad

mview store,  825, scene=08_oxyanion_hole
mview store,  915, scene=08_oxyanion_hole

mview store,  975, scene=09_ach_vs_huperzine
mview store, 1080, scene=09_ach_vs_huperzine

mview store, 1170, scene=10_pull_back
mview store, 1290, scene=10_pull_back

frame 1
# Press play.
#
# Things to try:
# 1. Make the triad shot last longer: move its second keyframe from
#    765 to 840 (and shift everything after it by 75 frames).
# 2. Skip a scene: delete its two keyframes with
#       mview clear, 270
#       mview clear, 345
# 3. Add the 02_acetylcholine scene. Where in the story does it fit?
#
# ---- the one-line version ------------------------------------------------
# The menu Movie > Program > Scene Loop builds a similar movie in one go:
#   movie.add_scenes(["01_enzyme", "03_buried_substrate", "07_catalytic_triad"], pause=2)
# Quick, but you do not control the timing of each shot.
