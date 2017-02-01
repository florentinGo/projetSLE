#!/bin/bash

# TEST de chaque niveau de décompression pour une compression de niveau 5
for x in {0..5};
do
	./bin/exec 5 $x so_useless.pgm partialDecomp_${x}.pgm
done

rm so_useless.pgm
