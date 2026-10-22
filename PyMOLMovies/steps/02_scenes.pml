# =====================================================================
#  Step 2: scenes  (run step 1 first)
#      @steps/02_scenes.pml
# ---------------------------------------------------------------------
#  A scene is a snapshot you can jump back to. It remembers:
#     the camera view, which objects are on, which representations are
#     shown (cartoon, sticks, surface...), colours, and a caption.
#  It does NOT remember:
#     label text, or settings such as transparency.
#     (That is why step 1 made separate label objects and a separate
#      see-through surface.)
#
#  The recipe for every scene is the same:
#     1. switch off what you do not need       disable all / hide
#     2. switch on and show what you need      enable / show
#     3. place the camera                      mouse, or set_view
#     4. store it                              scene NAME, store
#
#  How to get a set_view line for your own scene: move the molecule
#  with the mouse until you like it, then type   get_view
#  and copy the set_view (...) block it prints.
#
#  Captions: no commas or quote marks inside message=
# =====================================================================

scene *, clear

# ---- 01 The enzyme ------------------------------------------------------
disable all
hide everything, ache or ach or hupa
enable ache_surf
enable ach
show sticks, ach
set_view (\
     0.126,    0.934,   -0.333,\
    -0.467,   -0.240,   -0.851,\
    -0.875,    0.263,    0.406,\
     0.000,    0.000, -155.999,\
     4.779,   64.860,   56.291,\
   114.498,  197.500,  -25.000 )
scene 01_enzyme, store, message=Acetylcholinesterase from the Pacific electric ray (PDB 2ACE). The dark hole in the middle is the gorge.

# ---- 02 The substrate on its own ------------------------------------------
disable all
hide everything, ache or ach or hupa
enable ach
show sticks, ach
set_view (\
     0.086,    0.582,   -0.809,\
    -0.878,   -0.339,   -0.338,\
    -0.470,    0.739,    0.482,\
     0.000,    0.000,  -30.387,\
     5.126,   66.067,   62.805,\
    22.303,   38.471,  -25.000 )
scene 02_acetylcholine, store, message=Acetylcholine: a positively charged choline head and an acetyl ester tail.

# ---- 03 Where is it? See-through surface -----------------------------------
disable all
hide everything, ache or ach or hupa
enable ache_glass
enable ach
show spheres, ach
set_view (\
     0.126,   -0.333,   -0.934,\
    -0.467,   -0.851,    0.240,\
    -0.875,    0.406,   -0.263,\
     0.000,    0.000, -116.090,\
     5.126,   66.067,   62.805,\
    85.206,  146.974,  -25.000 )
scene 03_buried_substrate, store, message=Seen from the side: the substrate sits deep inside the protein and not on its surface.

# ---- 04 Cut the protein open (clipping) ------------------------------------
# The last line of numbers in set_view holds the front and back clipping
# planes. Here they sit only 8 A apart: a thin slice through the gorge.
# Try it by hand: hold Shift and drag with the right mouse button,
# or use the command   clip slab, 8
disable all
hide everything, ache or ach or hupa
enable ache_surf
enable ach
show sticks, ach
enable d_gorge
set_view (\
     0.126,   -0.333,   -0.934,\
    -0.467,   -0.851,    0.240,\
    -0.875,    0.406,   -0.263,\
     0.000,    0.000,  -58.594,\
     4.508,   66.044,   63.348,\
    54.594,   62.594,  -25.000 )
scene 04_gorge_cut, store, message=A slice through the gorge. Trp279 at the mouth to Trp84 at the bottom: 16 A.

# ---- 05 Same view as cartoon -----------------------------------------------
disable all
hide everything, ache or ach or hupa
enable ache
show cartoon, ache
enable ach
show sticks, ach
set_view (\
     0.126,   -0.333,   -0.934,\
    -0.467,   -0.851,    0.240,\
    -0.875,    0.406,   -0.263,\
     0.000,    0.000,  -80.005,\
     5.126,   66.067,   62.805,\
    58.721,  101.289,  -25.000 )
scene 05_cartoon, store, message=The same view as cartoon. Now we can see the fold under the surface.

# ---- 06 The aromatic gorge ---------------------------------------------------
disable all
hide everything, ache or ach or hupa
enable ache
show cartoon, ache
show sticks, gorge_aromatics
enable ach
show sticks, ach
enable lab_gorge
set_view (\
     0.126,   -0.333,   -0.934,\
    -0.467,   -0.851,    0.240,\
    -0.875,    0.406,   -0.263,\
     0.000,    0.000,  -59.572,\
     4.026,   65.850,   65.939,\
    43.724,   75.420,  -25.000 )
scene 06_aromatic_gorge, store, message=Fourteen aromatic side chains line the gorge. Trp84 at the bottom holds the choline head and Trp279 sits at the mouth.

# ---- 07 The catalytic triad ---------------------------------------------------
disable all
hide everything, ache or ach or hupa
enable ache
show cartoon, ache
show sticks, triad and not name N+C+O
enable ach
show sticks, ach
enable d_triad1
enable d_triad2
enable d_attack
enable lab_triad
set_view (\
     0.997,   -0.029,    0.064,\
    -0.066,   -0.716,    0.695,\
     0.026,   -0.697,   -0.716,\
     0.000,    0.000,  -41.879,\
     8.539,   65.706,   62.283,\
    30.738,   53.021,  -25.000 )
scene 07_catalytic_triad, store, message=The catalytic triad: Ser200 + His440 + Glu327. In this model ACh is already bonded to Ser200 (1.5 A).

# ---- 08 The oxyanion hole -------------------------------------------------------
disable all
hide everything, ache or ach or hupa
enable ache
show cartoon, ache
show sticks, (triad or oxyanion) and not name C+O
show sticks, oxyanion
enable ach
show sticks, ach
enable water
show spheres, water
enable d_oxy118
enable d_oxy119
enable d_oxy201
enable d_attack
enable lab_oxyanion
set_view (\
     0.997,   -0.029,    0.064,\
    -0.066,   -0.716,    0.695,\
     0.026,   -0.697,   -0.716,\
     0.000,    0.000,  -41.021,\
     3.418,   64.021,   60.989,\
    30.108,   51.934,  -25.000 )
scene 08_oxyanion_hole, store, message=The oxyanion hole: backbone NH groups of Gly118 + Gly119 + Ala201 point at the carbonyl oxygen. Red sphere: a crystal water from the empty enzyme that sits where ACh was modelled.

# ---- 09 A real drug in the same pocket --------------------------------------------
disable all
hide everything, ache or ach or hupa
enable ache
show cartoon, ache
show sticks, ache and resi 84+330+200 and not name N+C+O
enable ach
show sticks, ach
enable hupa
show sticks, hupa
enable lab_ligands
set_view (\
     0.548,   -0.534,    0.644,\
    -0.836,   -0.318,    0.448,\
    -0.034,   -0.783,   -0.621,\
     0.000,    0.000,  -44.750,\
     3.862,   67.251,   63.076,\
    32.845,   56.655,  -25.000 )
scene 09_ach_vs_huperzine, store, message=Yellow: ACh modelled into 2ACE. Green: the drug huperzine A as seen in the crystal (1VOT). Same pocket and a different grip.

# ---- 10 Pull back -------------------------------------------------------------------
disable all
hide everything, ache or ach or hupa
enable ache_surf
set_view (\
    -0.057,    0.934,   -0.351,\
    -0.830,   -0.240,   -0.503,\
    -0.555,    0.263,    0.789,\
     0.000,    0.000, -155.999,\
     4.779,   64.860,   56.291,\
   114.498,  197.500,  -25.000 )
scene 10_pull_back, store, message=Back out to the whole enzyme.

# ---- try it ----------------------------------------------------------------------------
# Jump between scenes with the buttons at the bottom right of the viewer,
# with Page Up / Page Down, or by name:
set scene_buttons, 1
scene 01_enzyme
#   scene 07_catalytic_triad
#
# How long the camera takes to fly between scenes (seconds):
#   set scene_animation_duration, 3
