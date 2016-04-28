#!/bin/bash

# send to mouse.vision (requires access to the site so only Rob can do right now)

mkdir Ca_Analysis
cp handout/Ca_Imaging_Analysis.pdf Ca_Analysis
cp -r MATLAB_exercises Ca_Analysis
zip -r ca.zip Ca_Analysis 
rm -fr Ca_Analysis
scp ca.zip raacampbell@mouse.vision:~/public_html/
scp handout/Ca_Imaging_Analysis.pdf raacampbell@mouse.vision:~/public_html/
rm -f ca.zip
