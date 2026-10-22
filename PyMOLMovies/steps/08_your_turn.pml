# =====================================================================
#  Step 8: your turn  (run steps 1 and 2 first)
#      @steps/08_your_turn.pml
# ---------------------------------------------------------------------
#  Make a 15 second movie that answers ONE question:
#
#      How does huperzine A stop acetylcholinesterase from working?
#
#  (Hint: compare where huperzine A sits with where ACh sits, and
#   which residues it touches. Both are already loaded: hupa and ach.)
#
#  1. STORYBOARD first, on paper. Three shots is plenty:
#        shot 1  where are we?            (wide)
#        shot 2  what are we looking at?  (closer)
#        shot 3  the answer               (close, labelled)
#  2. Make one scene per shot. Use the recipe from step 2.
#  3. Join them with mview keyframes. Use the timing from step 4.
#  4. Add ONE extra from steps 3, 5 or 6: a rock, a fade or a moving object.
#  5. Save the session (step 7). Render if there is time.
#
#  Fill in the blanks (____) below, or throw this away and type your own.
# =====================================================================

# ---- shot 1 ---------------------------------------------------------------
disable all
hide everything, ache or ach or hupa
enable ____
show ____, ____
# move the molecule with the mouse, then store:
scene my_01, store, message=____

# ---- shot 2 ---------------------------------------------------------------
disable all
hide everything, ache or ach or hupa
enable ____
show ____, ____
scene my_02, store, message=____

# ---- shot 3 ---------------------------------------------------------------
# Useful: the residues that touch huperzine A
#    select hupa_site, byres (ache within 4 of hupa)
#    show sticks, hupa_site and not name N+C+O
# and a measurement
#    distance d_hupa, hupa and name ____, ache and resi ____ and name ____
disable all
hide everything, ache or ach or hupa
enable ____
show ____, ____
scene my_03, store, message=____

# ---- the movie: 15 s at 30 frames per second = 450 frames ------------------------
set movie_fps, 30
mset 1 x450
mview store,   1, scene=my_01
mview store,  90, scene=my_01
mview store, ___, scene=my_02
mview store, ___, scene=my_02
mview store, ___, scene=my_03
mview store, 450, scene=my_03
frame 1

save my_huperzine_movie.pse
