# Calcium imaging analysis in MATLAB

This repository contains material for the calcium imaging analysis tutorial
run by the Mrsic-Flogel lab for the ndergraduate *Blockkurs* students. 
The analysis is conducted in MATLAB. 


## Handout

The handout has been written with LaTeX. Sources are in the `handout` sub-folder.
To get a .pdf for sources:

- Make sure you have TeX distribution installed on your computer, e.g.
  [TeX Live](https://www.tug.org/texlive/),
- Use `latexmk -pdf Ca_Imaging_Analysis.tex` in the command line, in the
  `handout` folder,
- Get rid of auxiliary file with `latexmk -c`, in the same folder.

A precompiled version is available at
[mouse.vision](http://mouse.vision/Ca_Imaging_Analysis.pdf).


## Code

- Exercises code is located in the `MATLAB_exercises` sub-folder.
- Solutions are located in the `MATLAB_complete` sub-folder. It only contains
  function files that need to be completed.


## Note for maintainer

Run `sendToWeb.sh` script to upload material to
[mouse.vision](http://mouse.vision). Note that you need to be Rob ;-).
