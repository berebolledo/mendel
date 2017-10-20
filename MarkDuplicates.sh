#! /bin/bash

inputbam=${1}
outputname=${inputbam%.*}

picard MarkDuplicates            \
    I=${inputbam}                \
    O=markDups.${inputbam}         \
    M=${outputname}.metrics.txt  \
    ASO=coordinate               \
    VALIDATION_STRINGENCY=SILENT \
    TMP_DIR=${outputname}_tmpdir \
    VERBOSITY=ERROR              \
    QUIET=true

# Clean up

if [ $? -eq 0 ]
then
    rm -f ${inputbam}
fi  

rm -fr ${outputname}_tmpdir
