#!/usr/bin/env Rscript

args = commandArgs(trailingOnly=TRUE)

# test if there is 1 argument: if not, return an error
if (length(args)!=1) {
   stop("One argument must be supplied (input file name)", call.=FALSE)
}

d <- read.table(args[1], header=FALSE)
d[, 4] <- scale(d[, 4])
output_file <- sub("\\.bg$", "_scaled.bg", args[1], ignore.case=TRUE)
write.table(d, output_file, row.names=F, col.names=F, quote=F, sep="\t")

