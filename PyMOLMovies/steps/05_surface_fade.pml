# =====================================================================
#  Step 5: fade the surface away to reveal the cartoon
#  (run steps 1 and 2 first)       @steps/05_surface_fade.pml
# ---------------------------------------------------------------------
#  In the original video this shot was made in Blender. PyMOL can do it.
#
#  Scenes and mview keyframes cannot fade anything, because transparency
#  is a SETTING and they do not store settings. Instead we attach a
#  command to every frame with  mdo:
#
#     mdo FRAME: COMMAND        run COMMAND whenever the movie reaches FRAME
#     mappend FRAME: COMMAND    add one more command to that frame
#
#  Here each frame sets the surface a little more transparent.
#  Writing 90 mdo lines by hand is boring, so a short Python loop
#  (between "python" and "python end") writes them for us.
# =====================================================================

set movie_fps, 30

# a fresh surface copy that only this shot uses
create ache_fade, ache
hide everything, ache_fade
show surface, ache_fade
set surface_color, ache_purple, ache_fade

# start from the cartoon scene and put the surface on top of it
scene 05_cartoon, animate=0
enable ache_fade
# scene 05 clips off the front of the protein. Open the clipping planes
# up so the whole surface is in the shot:
clip slab, 90

# 6 seconds: 1 s solid, 3 s fading, 2 s cartoon only
mset 1 x180

# the camera turns 25 degrees while this happens
frame 1
mview store
turn y, 25
frame 180
mview store

python
for frame_no in range(1, 181):
    t = min(max((frame_no - 30) / 90.0, 0.0), 1.0)      # 0 until frame 30, 1 from frame 120
    cmd.mdo(frame_no, "set transparency, %.3f, ache_fade" % t)
python end

# switch the surface off completely once it is invisible (faster to draw)
mappend 121: disable ache_fade
mappend 1: enable ache_fade

frame 1
# Press play.
#
# Try:
# 1. Fade faster: change 90.0 to 45.0
# 2. Fade the other way (cartoon to surface): use   t = 1 - ...
# 3. Look at what one frame holds:   mdo 60:   with nothing after the
#    colon clears frame 60. Play again and look for the jump.
