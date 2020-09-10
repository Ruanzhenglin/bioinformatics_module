import os, sys, subprocess

'''
# Alignment module with bwa program
# Date: Tue Sep 8 2020
# Author: Zen
# BWA cite
# Li H. (2013) Aligning sequence reads, clone sequences 
# and assembly contigs with BWA-MEM. arXiv:1303.3997v2 [q-bio.GN]
# BWA projects site: https://github.com/lh3/bwa
'''

ref_fa=os.path.join(os.getcwd(),'reference/chr20_GRCh38.fasta')
fq_r1=os.path.join(os.getcwd(), 'raw_data/U0a_CGATGT_L001_R1.fastq')
fq_r2=os.path.join(os.getcwd(), 'raw_data/U0a_CGATGT_L001_R2.fastq')
result_path=os.path.join(os.getcwd(), 'results/storage')
bam_file=os.path.join(result_path, 'U0a_CGATGT_L001.sam')


def build_index(ref_fa):
    # Build reference index
    print('Build index of reference genome')
    build_index_cmd=["bwa", "index", ref_fa]
    subprocess.run(build_index_cmd)


def align():
    # Alignment
    print('Execute alignment')
    align_cmd=["bwa","mem", "-t 8", ref_fa, fq_r1, fq_r2]
    with open(bam_file, 'w') as outfile:
        subprocess.run(align_cmd, stdout=outfile)
    print('Alignment has completed successfully')


def print_to_stderr(*args):
    # Print log
    print(*args, file=sys.stderr)


build_index(ref_fa)
# align()
print_to_stderr('Log: ')



