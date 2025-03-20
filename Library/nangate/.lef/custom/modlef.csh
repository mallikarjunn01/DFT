#!/bin/csh -f

sed -e 's/VIA1/VIA12/' \
    -e 's/VIA2/VIA23/' \
    -e 's/VIA3/VIA34/' \
    -e 's/VIA4/VIA45/' \
    -e 's/VIA5/VIA56/' $1 > ${1}_mod

