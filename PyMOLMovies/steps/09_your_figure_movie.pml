# =====================================================================
#  Step 9: turn YOUR project figure into a movie
#      @steps/09_your_figure_movie.pml     (after you edit it)
# ---------------------------------------------------------------------
#  You already have a .pml script that makes a figure for your paper.
#  It loads your protein, colours it and sets the camera with set_view.
#  That is exactly what a scene needs. We will:
#
#     shot 1  wide: the whole protein                    (new)
#     shot 2  YOUR FIGURE, exactly as in the paper       (from your .pml)
#     shot 3  close-up on the part your figure is about  (new)
#     then a gentle rock to finish
#
#  About 12 seconds. Work in pairs or as a project team.
#
#  BEFORE YOU RUN YOUR FIGURE SCRIPT, open it in a text editor and put a
#  # in front of these lines (they are slow or they get in the way):
#      ray
#      png ...
#  If PyMOL says a file is not found, fix the path in the load line,
#  or replace it with   fetch XXXX   (XXXX = the PDB code).
# =====================================================================

reinitialize

# ---- 1. build your figure ---------------------------------------------
# Change the path to YOUR figure script. Quotes are needed if the
# path has spaces in it.
@____/your_figure.pml

# Your figure is on screen now, in your paper's camera view.
# Store it straight away, before you touch the mouse:
scene my_figure, store, message=____

# ---- 2. the wide opening shot ------------------------------------------
# Show the whole thing. orient picks a good overall view.
# You may want extra objects on for this shot: enable them here.
orient
scene my_wide, store, message=____

# ---- 3. the close-up -----------------------------------------------------
# Go back to your figure, then zoom on the part the figure is about:
# a ligand, an active site, a loop, a mutation...
# Keep the selection SMALL and name the chain, or PyMOL zooms on every
# copy in the file. The number is the margin around it in A.
#   examples:   zoom chain A and resn NAP, 3
#               zoom chain A and resi 8-15, 3
#               zoom chain A and resi 248, 5
# Your script may already have a selection you can use (look for
# select lines), for example:   zoom pocket, 3
scene my_figure, animate=0
zoom ____, 3
# optional: labels or sticks that only belong in the close-up
#   show sticks, ____
scene my_closeup, store, message=____

# ---- 4. the movie: 12 s at 30 frames per second --------------------------
set movie_fps, 30
mset 1 x300
mview store,   1, scene=my_wide
mview store,  45, scene=my_wide
mview store, 120, scene=my_figure
mview store, 195, scene=my_figure
mview store, 255, scene=my_closeup
mview store, 300, scene=my_closeup
# a rock on the close-up, added after frame 300
scene my_closeup, animate=0
movie.add_rock(3, angle=20, axis="y", start=301)
frame 1

# Press play. Change the numbers until the timing feels right.
# Save it:
save my_figure_movie.pse

# =====================================================================
#  STRETCH: two panels of the same figure as two scenes
# ---------------------------------------------------------------------
#  If your figure has panel A and panel B, make each one a scene and
#  fly between them. The catch: panel B's script must not undo panel A.
#  Copy panel B's script and put a # in front of:
#      delete all / reinitialize       (wipes panel A)
#      fetch / load of a structure that is ALREADY loaded
#      remove ...                      (deletes atoms panel A needs)
#  Settings like bg_color or cartoon_transparency are not stored in
#  scenes, so the last script to set them wins for both panels.
#
#    @____/panelA.pml
#    scene panel_A, store, message=____
#    @____/panelB_edited.pml
#    scene panel_B, store, message=____
#    mset 1 x240
#    mview store,   1, scene=panel_A
#    mview store,  75, scene=panel_A
#    mview store, 165, scene=panel_B
#    mview store, 240, scene=panel_B
# =====================================================================
