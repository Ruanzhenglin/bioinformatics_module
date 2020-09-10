#!/bin/bash
# Uncompress rawdata, like fastq.gz/fq.gz that have compressed 

fq_path="./raw_data"
sample_name="U0a_CGATGT_L001_"
uncompress_fq(){
    for fq_file in ${fq_path}/*.gz
    do
    echo ${fq_file}
    gunzip -k ${fq_file}
    done
}

# uncompress_fq 

rename_sample() {
    mv ${fq_path}/${sample_name}R1*.fastq ${fq_path}/${sample_name}R1.fastq
    mv ${fq_path}/${sample_name}R2*.fastq ${fq_path}/${sample_name}R2.fastq

}

rename_sample