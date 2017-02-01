#!/bin/bash


display image/lena2.pgm &

./bin/exec 2 0 decomp_ond.pgm trans_ond.pgm

display bin/trans_ond.pgm &
display decomp_ond.pgm &


