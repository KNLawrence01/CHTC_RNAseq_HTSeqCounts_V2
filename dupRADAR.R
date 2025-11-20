r

args <- commandArgs(trailingOnly = TRUE)

bam_file <- args[1]
gtf_file <- args[2]
output_file <- args[3]

stranded <- 1     # 0 = unstranded, 1 = stranded, 2 = reverse stranded
paired <- TRUE    # paired-end library
threads <- 4      # number of threads

library(dupRadar)

duprates <- analyzeDuprates(
  bam = bam_file,
  gtf = gtf_file,
  stranded = stranded,
  paired = paired,
  threads = threads
)

write.csv(duprates, file = output_file, row.names = FALSE)
