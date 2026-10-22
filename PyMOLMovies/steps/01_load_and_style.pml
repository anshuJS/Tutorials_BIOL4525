# =====================================================================
#  PyMOL scenes and movies workshop  |  Step 1: load and style
#  Acetylcholinesterase (AChE) from the Pacific electric ray
# ---------------------------------------------------------------------
#  Before you start, point PyMOL at the workshop folder, for example:
#      cd ~/Desktop/workshop
#  then run this file:
#      @steps/01_load_and_style.pml
#
#  Every line below can also be typed by hand at the PyMOL> prompt.
#  Lines that start with # are comments. PyMOL ignores them.
# =====================================================================

reinitialize

# ---- 1. load the two structures --------------------------------------
# 2ACE: native AChE. The acetylcholine (ACh) in this file was placed by
#       modelling (occupancy 0), so treat it as a model, not an observation.
# 1VOT: AChE with the Alzheimer's drug huperzine A, seen in the crystal.
# No internet? Both files are in structures/. With internet you could
# also type:  fetch 2ace   and   fetch 1vot
load structures/2ace.pdb, raw2ace
load structures/1vot.cif, raw1vot

# put 1VOT on top of 2ACE (same protein, so this is almost perfect)
align raw1vot and name CA, raw2ace and name CA
remove hydro

# ---- 2. split into objects --------------------------------------------
# One object per "actor" in the story. Scenes can switch whole objects
# on and off, so separate objects give you more control later.
create ache,  raw2ace and polymer
create ach,   raw2ace and resn ACH
create hupa,  raw1vot and resn HUP
create water, raw2ace and resn HOH and resi 682
# water 742 sits 4 A from the ACh carbonyl carbon. Step 6 uses it
# as the water that hydrolyses the acetyl-enzyme.
create water_in, raw2ace and resn HOH and resi 742
delete raw2ace
delete raw1vot

# Two extra copies of the protein, used only for surfaces:
# ache_surf is solid, ache_glass is see-through.
create ache_surf,  ache
create ache_glass, ache

# ---- 3. named selections ------------------------------------------------
select triad,    ache and resi 200+440+327
select oxyanion, ache and resi 118+119+201
select gorge_aromatics, ache and resi 70+84+121+130+199+233+279+288+290+330+331+334+432+442 and not name N+C+O
deselect

# ---- 4. the look of the video -------------------------------------------
bg_color black
set_color ache_purple, [0.45, 0.15, 0.95]

hide everything
color ache_purple, ache or ache_surf or ache_glass
color cyan, ache and elem C and (triad or oxyanion or gorge_aromatics or resi 199)
util.cnc ache
color yellow, ach and elem C
util.cnc ach
color limegreen, hupa and elem C
util.cnc hupa
color red, water or water_in

show surface, ache_surf
show surface, ache_glass
set transparency, 0.6, ache_glass

# rendering settings (try changing these and see what happens)
set cartoon_fancy_helices, 1
set cartoon_side_chain_helper, 1
set cartoon_transparency, 0.5, ache
set stick_radius, 0.22
set sphere_scale, 0.3
set sphere_scale, 1.0, ach
set sphere_scale, 0.35, water
set antialias, 2
set ray_shadow, 0
set spec_reflect, 0.4
set depth_cue, 1
set fog_start, 0.55
set field_of_view, 25
set surface_quality, 1
set transparency_mode, 3
# colour the inside of a cut-open surface (seen when you clip into it)
set ray_interior_color, grey20

# measurements and labels
set dash_color, yellow
set dash_gap, 0.35
set dash_radius, 0.07
set label_color, white
set label_size, 22
set label_font_id, 7
set float_labels, 1
set label_bg_color, grey30
set label_bg_transparency, 0.2

# ---- 5. measurements -------------------------------------------------------
# Gorge length: from the middle of the Trp279 ring (gorge mouth)
# to the middle of the Trp84 ring (gorge bottom).
pseudoatom p_mouth,  ache and resi 279 and name CD2+CE2+CE3+CZ2+CZ3+CH2
pseudoatom p_bottom, ache and resi 84  and name CD2+CE2+CE3+CZ2+CZ3+CH2
hide everything, p_mouth or p_bottom
distance d_gorge, p_mouth, p_bottom

# catalytic triad hydrogen bonds: Ser200 - His440 - Glu327
distance d_triad1, ache and resi 200 and name OG,  ache and resi 440 and name NE2
distance d_triad2, ache and resi 440 and name ND1, ache and resi 327 and name OE1
# Ser200 oxygen to the ACh carbonyl carbon (1.5 A: bonded in this model)
distance d_attack, ache and resi 200 and name OG, ach and name C5
# oxyanion hole: backbone NH groups pointing at the ACh carbonyl oxygen
distance d_oxy118, ache and resi 118 and name N, ach and name O7
distance d_oxy119, ache and resi 119 and name N, ach and name O7
distance d_oxy201, ache and resi 201 and name N, ach and name O7

# ---- 6. labels -----------------------------------------------------------
# A scene does NOT remember label text, so each scene gets its own label
# object. A pseudoatom is an invisible point that can carry a label.
pseudoatom lab_gorge, ache and resi 84  and not name N+C+O+CA, label=Trp84
pseudoatom lab_gorge, ache and resi 279 and not name N+C+O+CA, label=Trp279
pseudoatom lab_gorge, ache and resi 330 and not name N+C+O+CA, label=Phe330
pseudoatom lab_gorge, ache and resi 121 and not name N+C+O+CA, label=Tyr121

pseudoatom lab_triad, ache and resi 200 and not name N+C+O+CA, label=Ser200
pseudoatom lab_triad, ache and resi 440 and not name N+C+O+CA, label=His440
pseudoatom lab_triad, ache and resi 327 and not name N+C+O+CA, label=Glu327

pseudoatom lab_oxyanion, ache and resi 118 and name CA, label=Gly118
pseudoatom lab_oxyanion, ache and resi 119 and name CA, label=Gly119
pseudoatom lab_oxyanion, ache and resi 201 and not name N+C+O+CA, label=Ala201
pseudoatom lab_oxyanion, ache and resi 200 and not name N+C+O+CA, label=Ser200

pseudoatom lab_ligands, ache and resi 84  and not name N+C+O+CA, label=Trp84
pseudoatom lab_ligands, ache and resi 330 and not name N+C+O+CA, label=Phe330
pseudoatom lab_ligands, ache and resi 200 and not name N+C+O+CA, label=Ser200

hide everything, lab_*
show labels, lab_*
set label_position, (0, 0, 4), lab_*
set label_size, 22, d_*

# start with everything off except the solid surface
disable all
enable ache_surf
orient ache

# Look at what you made: the object list on the right shows every actor.
# Click the names to switch them on and off.
