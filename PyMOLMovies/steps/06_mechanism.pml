# =====================================================================
#  Step 6: act out the reaction  (run steps 1 and 2 first)
#      @steps/06_mechanism.pml
# ---------------------------------------------------------------------
#  The second Blender shot in the original video showed the reaction:
#     1. ACh slides down the gorge
#     2. Ser200 attacks the ACh carbonyl carbon
#     3. choline leaves (the acetyl group stays on Ser200)
#     4. a water comes in and attacks the acetyl carbon
#     5. acetate leaves and Ser200 is free again
#
#  Here we act it out in PyMOL by MOVING OBJECTS. The camera can have
#  keyframes, and so can every object:
#
#     translate [x, y, z], object=NAME, camera=0   move an object
#     matrix_reset NAME, mode=1                   put it back home
#        (mode=1 matters: it resets the movie matrix that translate moved)
#     mview store, FRAME, object=NAME             remember where it is
#
#  PyMOL slides the object between its keyframes.
#
#  This is a CARTOON of the chemistry. Bonds do not really form or break
#  in PyMOL: we just move pieces and switch dashed lines on and off.
#  The ACh pose is the model from 2ACE, not an experimental structure.
# =====================================================================

set movie_fps, 30
# IMPORTANT: by default PyMOL saves a keyframe by itself every time you move
# an object while a movie exists (movie_auto_store). We want to decide
# ourselves which frames get keyframes, so switch that off:
set movie_auto_store, 0

# ---- the actors (ball and stick, like the original animation) ----------
create m_ach,     ach
create m_choline, ach and name N1+C2+C3+O4+C8+C9+C10
create m_acetyl,  ach and name C5+C6+O7
create m_water,   water_in
hide everything, m_*
show sticks,  m_ach or m_choline or m_acetyl
show spheres, m_*
set sphere_scale, 0.25, m_ach or m_choline or m_acetyl
set sphere_scale, 0.35, m_water
set stick_radius, 0.16, m_*

# moving labels: a label sits on an atom, so it travels with the object
label m_choline and name N1, "choline"
label m_acetyl and name C6, "acetyl group"
label m_water, "water"
# nudge labels sideways so they do not sit on top of each other
set label_position, (3, 1.5, 8), m_acetyl
set label_position, (-3, 1.5, 8), m_water
set label_position, (-3, 0, 8), m_choline
# label boxes do not follow a shifted label, so drop the boxes on movers
set label_bg_transparency, 1.0, m_*
set label_outline_color, black, m_*

# the bond that Ser200 makes with the acetyl carbon, shown as a dashed line
distance d_newbond, ache and resi 200 and name OG, ach and name C5
pseudoatom lab_newbond, pos=[6.19, 63.68, 60.76], label=new bond
hide everything, lab_newbond
show labels, lab_newbond
set dash_color, white, d_newbond
set dash_radius, 0.12, d_newbond

# ---- the set: see-through cartoon with the gorge lining as sticks -------
disable all
hide everything, ache or ach or hupa
enable ache
show cartoon, ache
show sticks, (gorge_aromatics or triad) and not name N+C+O
pseudoatom lab_mech, ache and resi 200 and not name N+C+O+CA, label=Ser200
pseudoatom lab_mech, ache and resi 84  and not name N+C+O+CA, label=Trp84
pseudoatom lab_mech, ache and resi 279 and not name N+C+O+CA, label=Trp279
hide everything, lab_mech
show labels, lab_mech
set label_position, (0, 0, 4), lab_mech
enable lab_mech
enable m_ach
# side view of the gorge: mouth at the top, Trp84 at the bottom
set_view (\
     0.126,   -0.333,   -0.934,\
    -0.467,   -0.851,    0.240,\
    -0.875,    0.406,   -0.263,\
     0.000,    0.000,  -76.000,\
     2.028,   60.744,   68.375,\
    62.000,   92.000,  -25.000 )
scene 11_mechanism, store, message=A cartoon of the reaction. Pieces move and dashed lines show bonds forming. It is not a simulation.

# ---- the movie: 16 seconds ------------------------------------------------
mset 1 x480
scene 11_mechanism, animate=0
mview store, 1
turn y, -15
mview store, 480

# 1. ACh slides down the gorge (frames 1 to 90).
#    The gorge points along [-0.33, -0.85, 0.41], so moving 18 A that way
#    puts the ACh at the gorge mouth.
matrix_reset m_ach, mode=1
translate [-6.0, -15.3, 7.3], object=m_ach, camera=0
mview store, 1, object=m_ach
matrix_reset m_ach, mode=1
mview store, 90, object=m_ach
mview store, 150, object=m_ach

# 3. choline leaves back up the gorge (frames 150 to 240)
matrix_reset m_choline, mode=1
mview store, 150, object=m_choline
translate [-8.7, -22.1, 10.6], object=m_choline, camera=0
mview store, 240, object=m_choline

# 4. water comes down the gorge to the acetyl carbon (frames 240 to 300)
matrix_reset m_water, mode=1
translate [-4.0, -10.2, 4.9], object=m_water, camera=0
mview store, 1, object=m_water
mview store, 240, object=m_water
matrix_reset m_water, mode=1
translate [0.6, -0.22, -1.29], object=m_water, camera=0
mview store, 300, object=m_water
mview store, 330, object=m_water

# 5. acetate (acetyl + water) leaves up the gorge (frames 330 to 420)
matrix_reset m_acetyl, mode=1
mview store, 150, object=m_acetyl
mview store, 330, object=m_acetyl
translate [-8.7, -22.1, 10.6], object=m_acetyl, camera=0
mview store, 420, object=m_acetyl
matrix_reset m_water, mode=1
translate [-8.1, -22.3, 9.3], object=m_water, camera=0
mview store, 420, object=m_water

# ---- switches: what is visible when ----------------------------------------
# mdo replaces what a frame does, mappend adds to it.
mdo 1: enable m_ach
mappend 1: disable m_choline
mappend 1: disable m_acetyl
mappend 1: disable m_water
mappend 1: disable d_newbond
mappend 1: disable lab_newbond
# 2. Ser200 attacks: the new bond appears
mdo 100: enable d_newbond
mappend 100: enable lab_newbond
# 3. the ester bond breaks: swap the whole ACh for its two halves
mdo 150: disable m_ach
mappend 150: enable m_choline
mappend 150: enable m_acetyl
mappend 150: disable lab_newbond
# 4. the water arrives
mdo 240: enable m_water
mdo 241: disable m_choline
# 5. the acetyl leaves Ser200 as acetate (a label can be changed by mdo too)
mdo 330: disable d_newbond
mappend 330: label m_acetyl and name C6, "acetate"
mappend 1: label m_acetyl and name C6, "acetyl group"
mdo 421: disable m_acetyl
mappend 421: disable m_water

frame 1
# Press play.
#
# Try:
# 1. Make the choline leave more slowly: move its 240 keyframe to 300.
# 2. Use util.mroll or movie.add_rock from step 3 to see the empty
#    active site at the end.
# 3. Turn on the gorge aromatics (show sticks, gorge_aromatics) and
#    watch ACh slide past them.
