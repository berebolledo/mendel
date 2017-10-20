#! /bin/bash

read1=${1}
read2=${2}
RGID=${3}
RGLB=${4}
index="/home/boris/Data/references/Homo_sapiens/Ensembl/GRCh37/Sequence/BWAIndex/genome.fa"


bwa mem                                                       \
    -t 8                                                      \
    -M                                                        \
    -R "@RG\tID:${RGID}\tLB:${RGLB}\tSM:${RGID}\tPL:ILLUMINA" \
    ${index}                                                  \
    ${read1}                                                  \
    ${read2}| samtools view -@ 2 -Sb -o ${RGID}.bam - 2>/dev/null 
