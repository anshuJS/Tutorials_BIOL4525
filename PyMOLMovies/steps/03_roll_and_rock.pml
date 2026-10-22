# =====================================================================
#  Step 3: your first movies  (run steps 1 and 2 first)
#      @steps/03_roll_and_rock.pml
# ---------------------------------------------------------------------
#  A PyMOL movie is a list of FRAMES. At 30 frames per second,
#  300 frames = 10 seconds. The movie controls (play, stop, step)
#  sit at the bottom right of the viewer.
#
#  The quickest movies only move the CAMERA:
#     roll = spin all the way round        rock = swing back and forth
#  Both are also in the menu: Movie > Program > Camera Loop
#
#  A camera movie does not remember representations. It films whatever
#  is on screen when you play it. So recall a scene first, then
#  build the movie.
# =====================================================================

set movie_fps, 30

# ---- 3a. The intro roll from the original video -------------------------
# Whole enzyme, one full turn about the y axis in 8 seconds.
scene 01_enzyme, animate=0
mset
movie.add_roll(8, axis="y", start=1)

# Press play (or type mplay). Stop with mstop.
# How many frames did that make? Look at the frame counter, or type:
#   count_frames
#
# Try:   mset
#        movie.add_roll(4, axis="x", start=1)
# to roll faster and about the other axis.

# ---- 3b. A rock on the catalytic triad ------------------------------------
# A rock is better than a roll for a close-up: the viewer keeps their
# bearings and the labels never turn their back on you.
# Uncomment the next three lines (remove the #) and run them:
#   scene 07_catalytic_triad, animate=0
#   mset
#   movie.add_rock(6, angle=30, axis="y", start=1)

# ---- 3c. What is actually happening ----------------------------------------
# movie.add_roll is a shortcut for two simpler commands:
#   mset 1 x240           make 240 empty frames
#   util.mroll 1, 240, 1  fill them with a full turn
# Try that version too.
