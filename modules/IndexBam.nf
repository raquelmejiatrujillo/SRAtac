/*
Author : Trevor F. Freeman <trvrfreeman@gmail.com>
Date   : 2022-02-27
Purpose: Nextflow module
*/

process IndexBam {
    tag "${metadata.sampleName}"

    container 'quay.io/biocontainers/samtools:1.15--h1170115_1'

    publishDir "${params.baseDirData}/align", mode: 'copy', pattern: '*.bai'

    input:
        tuple val(metadata), path(bam)

    output:
        tuple val(metadata), path(bam), path('*.bai'), emit: bamBai

    script:
        """
        samtools index -b ${bam}
        """
}
