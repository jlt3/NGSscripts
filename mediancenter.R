#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly=TRUE)

if(length(args) != 1){
  stop("Please provide one input file name as an argument.")
}

# read input file
input_file <- args[1]
if(!file.exists(input_file)){
  stop("Input file does not exist.")
}

# read data
data <- read.table(input_file, header=FALSE)

# median center the 4th column
med <- median(data[, 4], na.rm=TRUE)
data[, 4] <- ifelse(is.na(data[, 4]), NA, data[, 4]-med)

# write output file
output_file <- gsub(".bg$", "_mediancentered.bg", input_file)
write.table(data, output_file, sep="\t", quote=FALSE, col.names=FALSE, row.names=FALSE)

