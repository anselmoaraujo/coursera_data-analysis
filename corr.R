# Write a function that takes a directory of data files and a threshold for complete cases and calculates 
# the correlation between sulfate and nitrate for monitor locations where the number of completely 
# observed cases (on all variables) is greater than the threshold. 
# The function should return a vector of correlations for the monitors that meet the threshold requirement. 
# If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. 
# A prototype of this function follows

corr <- function(directory, threshold = 0){
  ## directory is a char vector of length 1 indicating the location of the CSV files
  stopifnot(is.character(directory), length(directory) == 1)
  
  
  ## id is a numeric vector of length 1 indicating the number of completely observed
  ## observations (on all variables) required to compute the correlation between nitrate and
  ## sulfate.
  ## the default is 0
  
  threshold <- as.numeric(threshold)
  stopifnot(is.numeric(threshold))
  
  ## id is an integer vector indicating the monitor ID numbers to be used
  id <- as.integer(1:332)
  
  
  ## return a numeric vector of correlations
  ## do not round the results
  
  flist <- list.files(directory, pattern = 'csv$', full.names = FALSE, recursive = TRUE)
  
  # initiate empty data frame
  df <- data.frame(id = as.integer(), nobs = as.integer())
  
  for (fnumber in seq_along(flist)) {
    aux <- read.csv(file = file.path(directory, flist[fnumber]))
    aux <- aux[complete.cases(aux), ]
    df[fnumber, 1] <- fnumber
    df[fnumber, 2] <- nrow(aux)
  }
  df <- df[which(df$nobs > threshold), ]
  # check if nrow df > 0
  if (nrow(df) == 0) {
      corr_vector <- vector(mode = 'numeric', length = 0)
  } else {
      # create empty vector
      corr_vector <- rep(0, times = nrow(df))
      for (fnumber in seq_len(nrow(df))) {
        aux <- read.csv(file = file.path(directory, flist[df[fnumber, 1]]))
        aux <- aux[complete.cases(aux), ]
        corr_vector[fnumber] <- cor(x = aux$sulfate, y = aux$nitrate)
      }
  }
  corr_vector
}

