# Write a function named pollutantmean that calculates the mean of a pollutant (sulfate or nitrate)
# across a specific list of monitors. The function takes three arguments: directory, pollutant and id.
# Given a vector monitor ID numbers, pollutantmean reads that monitors' particulate matter data from the
# directory specified in the directory argument and returns the mean of the pollutant across all of the
# monitors, ignoring any missing values coded as NA. A prototype of the function is as follows:

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## directory is a char vector of length 1 indicating the location of the CSV files
  stopifnot(is.character(directory), length(directory) == 1)
  
  ## pollutant is a char vector of length 1 indicating the name of the pollutant
  stopifnot(is.character(pollutant), length(pollutant) == 1)
  ## for which we will calculate the mean (either sulfate or nitrate)
  
  ## id is an integer vector indicating the monitor ID numbers to be used
  id <- as.integer(id)
  stopifnot(is.integer(id))
  ## Return the mean of the pollutant across all monitors list in the id vector
  ## ignoring NA values
  ## Do not round the result!
  
  flist <- list.files(directory, pattern = 'csv$', full.names = FALSE, recursive = TRUE)
  flist <- flist[id]
  for (fnumber in seq_along(flist)) {
    aux <- read.csv(file = file.path(directory, flist[fnumber]))
    if (fnumber == 1) {
      final <- aux
    } else {
      final <- rbind(final, aux)
    }
  }
  if (pollutant == 'sulfate') {
      res <- mean(final$sulfate[!is.na(final$sulfate)])
  } else if (pollutant == 'nitrate') {
      res <- mean(final$nitrate[!is.na(final$nitrate)])
  } else {
    cat('this pollutant does not exist\n')
  }
  res
}
