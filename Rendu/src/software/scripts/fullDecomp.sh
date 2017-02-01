#!/bin/bash

# TEST de chaque niveau de compression avec décompression complète
for x in {1..9};
do
	./bin/exec $x 0 so_useless.pgm fullDecomp_${x}.pgm
done

rm so_useless.pgm
