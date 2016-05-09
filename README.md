# Calcium imaging analysis in MATLAB

This repository contains material for the calcium imaging analysis tutorial
given during the 2016 *Blockkurs*.


## Handout

Handout has been written with LaTeX. Sources are in the `handout` sub-folder.
To get a .pdf for sources:

- make sure you have TeX distribution installed on your computer, e.g.
  [TeX Live](https://www.tug.org/texlive/),
- use `latexmk -pdf basic_matlab.tex` in the command line, in the `handout`
  folder,
- get ride of auxiliary file with `latexmk -c`, in the same folder.

A precompiled version is available at
[mouse.vision](http://mouse.vision/Ca_Imaging_Analysis.pdf).


## Code

- Exercises code is located in `MATLAB_exercises` sub-folder.
- Solutions are located in `MATLAB_complete` sub-folder. It only contains
  functions files that need to be completed.


## Note for maintainer

Run `sendToWeb.sh` script to upload material to
[mouse.vision](http://mouse.vision). Note that you need to be Rob ;-).