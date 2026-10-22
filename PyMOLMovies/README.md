# PyMOL scenes and movies workshop

BIO 4525 Structural Bioinformatics of Proteins

Learn to tell a protein's story in PyMOL: scenes, camera moves, fades, moving molecules and movie export. Everything happens inside PyMOL.

**Protein:** acetylcholinesterase (AChE) from the Pacific electric ray, the enzyme that clears the neurotransmitter acetylcholine from synapses.
* **PDB 2ACE:** the enzyme, with acetylcholine (ACh) modelled in. The ACh is a model, not part of the experimental data.
* **PDB 1VOT:** the same enzyme with the Alzheimer's drug huperzine A, seen in the crystal.

## What you need

* PyMOL, either the licensed/educational version or open-source. Both work for every step. Only the licensed version can save a movie file directly; open-source saves PNG frames.
* This folder. On the [Tutorials_BIOL4525](https://github.com/anshuJS/Tutorials_BIOL4525) page click the green **Code** button, then **Download ZIP**, and unzip it somewhere easy to find, such as the Desktop. The workshop is the `PyMOLMovies` folder inside. No internet is needed after that.

## Getting started

1. Open PyMOL.
2. Go to the workshop folder, for example: `cd ~/Desktop/Tutorials_BIOL4525-main/PyMOLMovies`
3. Run the first step: `@steps/01_load_and_style.pml`
4. Run the next steps one at a time. Each file explains itself in its comments, so open it in a text editor and read along.

Behind? Load the checkpoint with `load checkpoints/after_step2.pse` and carry on from step 3.

## What is in here

| Folder or file | What it is |
|---|---|
| `steps/` | the scripts you run, one per part of the workshop |
| `structures/` | the two structures (2ACE and 1VOT) |
| `checkpoints/after_step2.pse` | the state after steps 1 and 2, for catching up |
| `sessions/AChE_workshop_final.pse` | the finished 68 s movie with all scenes. Open it, type `accept` at the security warning, and press play |
| `PyMOL_Movies_Handout.docx` | the printable handout with the storyboard page |

## The steps

| Step | File | You will learn |
|---|---|---|
| 1 | `01_load_and_style.pml` | objects, colours, measurements, labels |
| 2 | `02_scenes.pml` | scenes: store, recall, captions |
| 3 | `03_roll_and_rock.pml` | your first movie: roll and rock |
| 4 | `04_scene_movie.pml` | keyframes: a movie made of scenes |
| 5 | `05_surface_fade.pml` | fading a surface frame by frame |
| 6 | `06_mechanism.pml` | moving objects: act out the reaction |
| 7 | `07_export.pml` | saving sessions and movie files |
| 8 | `08_your_turn.pml` | make your own 15 s movie |

## Commands you will use

**Objects and looks**

| Command | Does |
|---|---|
| `create NAME, SELECTION` | copy atoms into a new object |
| `enable NAME` / `disable NAME` | switch an object on or off |
| `show cartoon, NAME` / `hide everything, NAME` | representations |
| `color cyan, SELECTION` | colour |
| `set transparency, 0.6, NAME` | see-through surface |
| `distance NAME, SEL1, SEL2` | dashed line with a distance |
| `pseudoatom NAME, SELECTION, label=TEXT` | a floating label |
| `get_view` / `set_view (...)` | print or set the exact camera |
| `clip slab, 8` | keep only an 8 A slice |

**Scenes**

| Command | Does |
|---|---|
| `scene NAME, store, message=TEXT` | save a scene |
| `scene NAME` | go to a scene (or press Page Up / Page Down) |
| `scene *, clear` | delete all scenes |

**Movies**

| Command | Does |
|---|---|
| `mset 1 x300` | make 300 frames (10 s at 30 fps) |
| `mset` | delete the movie |
| `mplay` / `mstop` | play / stop |
| `frame 120` | go to frame 120 |
| `movie.add_roll(8, axis="y", start=1)` | full turn in 8 s |
| `movie.add_rock(6, angle=30, axis="y", start=1)` | swing back and forth |
| `mview store, 90, scene=NAME` | keyframe: at frame 90 show scene NAME |
| `mview store, 90, object=NAME` | keyframe: where object NAME is at frame 90 |
| `mview clear, 90` | delete the keyframe at frame 90 |
| `mdo 90: COMMAND` | run COMMAND when the movie reaches frame 90 |
| `mappend 90: COMMAND` | add another command to frame 90 |
| `translate [x, y, z], object=NAME, camera=0` | move an object |
| `matrix_reset NAME, mode=1` | move it back home |

**Saving**

| Command | Does |
|---|---|
| `save my_movie.pse` | save everything, including scenes and the movie |
| `png pic.png, width=2400, height=1350, dpi=300, ray=1` | one high-quality picture |
| `movie.produce("my_movie.mpg", mode="ray", quality=90, width=1280, height=720)` | movie file (licensed PyMOL) |
| `mpng frames/frame_` | every frame as a PNG (any PyMOL) |

## Things that trip people up

1. **Scenes forget labels and settings.** A scene remembers the camera, which objects are on, representations and colours. It does not remember label text or settings like transparency. Make separate objects for those.
2. **No semicolons in `.pml` comments.** PyMOL treats `;` as the end of a command, even after `#`.
3. **No commas in scene captions.** The caption stops at the first comma.
4. **The movie controls the camera.** If you cannot move the molecule the way you want, the movie keyframes are taking over. Type `mset` to delete the movie.
5. **Turn off auto-store before moving objects:** `set movie_auto_store, 0`. Otherwise PyMOL saves keyframes you did not ask for.
6. **`matrix_reset NAME, mode=1`**, not plain `matrix_reset NAME`, to undo `translate ..., object=NAME`.
7. **Security warning when you open a session.** If a session contains `mdo` commands, PyMOL asks first. Type `accept` and the movie will play.
8. **Render small first.** A full ray-traced movie can take an hour. Test with `mode="draw"` and a small size.

## Plan your movie (step 8)

Question: how does huperzine A stop acetylcholinesterase?

| Shot | What we see | Objects and representations | Caption | Seconds |
|---|---|---|---|---|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |

Remember: hold each shot long enough to read the caption (about 2.5 s), and fly between shots in about 2 s.

## Data

* 2ACE: Raves M.L. et al. (1997) Structure of acetylcholinesterase complexed with the nootropic alkaloid, (-)-huperzine A. *Nat Struct Biol* 4:57-63.
* 1VOT: from the same paper.

Structures from the [RCSB Protein Data Bank](https://www.rcsb.org).
