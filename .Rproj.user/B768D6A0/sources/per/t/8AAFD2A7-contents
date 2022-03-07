# Write a function that reads a directory full of files and reports the number of completely observed cases
# in each data file. The function should return a data frame where the first column is the name of the file
# and the second column is the number of complete cases. A prototype of this function follows:

complete <- function(directory, id = 1:332){
  ## directory is a char vector of length 1 indicating the location of the CSV files
  stopifnot(is.character(directory), length(directory) == 1)
  
  
  ## id is an integer vector indicating the monitor ID numbers to be used
  id <- as.integer(id)
  stopifnot(is.integer(id))
  
  
  ## return a data frame of the form:
  ## id nobs
  ## 1  107
  ## 2  1041
  ## ...
  ## where id is the monitor ID number and nobs is the number of complete cases
  
  flist <- list.files(directory, pattern = 'csv$', full.names = FALSE, recursive = TRUE)
  flist <- flist[id]
  
  # initiate empty data frame
  df <- data.frame(id = as.integer(), nobs = as.integer())
  
  for (fnumber in seq_along(flist)) {
    aux <- read.csv(file = file.path(directory, flist[fnumber]))
    aux <- aux[complete.cases(aux), ]
    df[fnumber, 1] <- id[fnumber]
    df[fnumber, 2] <- nrow(aux)
  }
  df
}
