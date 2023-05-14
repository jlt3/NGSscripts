#!/usr/bin/Rscript

args <- commandArgs(trailingOnly = TRUE)

# Check if any argument is provided
if(length(args)==0){
    stop("No arguments provided. You must provide at least one file to normalize.", call. = FALSE)
}

library(preprocessCore)

data_list <- list()
na_locations_list <- list()

for (file in args) {
    # read the bedgraph file into a data frame
    df <- read.table(file, header = FALSE, stringsAsFactors = FALSE)
    
    # identify where NAs are in the data
    na_locations <- is.na(df[,4])
    na_locations_list[[file]] <- na_locations
    
    # replace NA values with the smallest non-NA value
    min_value <- min(df[!na_locations, 4], na.rm = TRUE)
    df[na_locations, 4] <- min_value
    
    data_list[[file]] <- df
}

# combine all data into a matrix
data_matrix <- do.call(cbind, lapply(data_list, function(df) df[,4]))

# perform quantile normalization
data_norm <- normalize.quantiles(data_matrix)

# split the normalized data back into separate data frames
data_norm_list <- split(data_norm, rep(names(data_list), each = nrow(data_norm)))

for (file in args) {
    df_norm <- data_list[[file]]
    df_norm[,4] <- data_norm_list[[file]]
    
    # replace the NA locations back with NA
    df_norm[na_locations_list[[file]], 4] <- NA
    
    # write the normalized data back to a bedgraph file
    outfile <- sub(".bg", "_quantile.bg", file)
    write.table(df_norm, outfile, row.names = FALSE, col.names = FALSE, quote = FALSE, sep = "\t")
}

