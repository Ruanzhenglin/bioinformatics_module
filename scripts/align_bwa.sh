# Alignment module with bwa program
# Date: Tue Sep 8 2020
# Author: Zen
# BWA cite
# Li H. (2013) Aligning sequence reads, clone sequences 
# and assembly contigs with BWA-MEM. arXiv:1303.3997v2 [q-bio.GN]
# BWA projects site: https://github.com/lh3/bwa

# Step1 build reference index

# Notice that $1 following parameter -p reference to
# Prefix of the output database [same as db filename] 
# and $2 require we input the reference name  

set -x

ref_fa="./reference/chr20_GRCh38.fasta"
fq_file="./raw_data"
result_path="./results/storage"
sample_name="U0a_CGATGT_L001_"
build_index(){
    bwa index ${ref_fa}
}

build_index  

# Begin to align 
echo "Execute alignment"
align(){
    bwa mem -t 8 ${ref_fa} \
    ${fq_file}/*R1.fastq \
    ${fq_file}/*R2.fastq \
    > ${result_path}/${sample_name}s1.sam
}

align
echo "Alignment has completed successfully"