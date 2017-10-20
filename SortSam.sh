#! /bin/bash

inputbam=${1}
outputname=${inputbam%.*}

picard SortSam                   \
    I=${inputbam}                \
    O=sorted.${inputbam}         \
    SO=coordinate                \
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
