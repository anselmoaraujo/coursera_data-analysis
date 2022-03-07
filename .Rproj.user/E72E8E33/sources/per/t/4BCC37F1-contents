# 4 Ranking hospitals in all states
# 
# Write a function called rankall that takes two arguments: an outcome name
# (outcome) and a hospital ranking (num). The function reads the
# outcome-of-care-measures.csv ﬁle and returns a 2-column data frame containing
# the hospital in each state that has the ranking speciﬁed in num. For example
# the function call rankall("heart attack", "best") would return a data frame
# containing the names of the hospitals that are the best in their respective
# states for 30-day heart attack death rates. The function should return a value
# for every state (some may be NA). The ﬁrst column in the data frame is named
# hospital, which contains the hospital name, and the second column is named
# state, which contains the 2-character abbreviation for the state name.
# Hospitals that do not have data on a particular outcome should be excluded
# from the set of hospitals when deciding the rankings.

# Handling ties. The rankall function should handle ties in the 30-day mortality
# rates in the same way that the rankhospital function handles ties.

rankall <- function(outcome, num = "best") { 
  ## Read outcome data
  dfile <- read.csv('outcome-of-care-measures.csv')
  ## Check that state and outcome are valid
  # Hospital Name varchar(50) = col 2
  # State varchar(2) = col 7
  # Hospital 30-day Death Rates from Heart Attack =  col 11
  # Hospital 30-day Death Rates from Heart Failure = col 17
  # Hospital 30-day Death Rates from Pneumonia = col 23
  subfile <- dfile[, c(2, 7, 11, 17, 23)]
  rm(dfile)
  names(subfile) <- c('Hospital', 'State', 'heart.attack', 'heart.failure', 'pneumonia')
  options(warn = -1)
  subfile[3:5] <- sapply(subfile[3:5], as.numeric)
  options(warn = 0)
  state_list <- sort(unique(subfile$State))
  outcome_list <- c('heart attack', 'heart failure', 'pneumonia')
  outcome_col <- c('heart attack' = 3, 'heart failure' = 4, 'pneumonia' = 5)
  ## Check outcome validity
  if (!(as.character(outcome) %in% outcome_list)) {
    stop('invalid outcome')
  }
  ## For each state, find the hospital of the given rank
  ##
  ## Remove NAs
  subfile <- subfile[complete.cases(subfile[, outcome_col[[outcome]]]), ]
  ## Order by outcome and Hospital Name
  subfile <- subfile[order(subfile[, 2], subfile[, outcome_col[[outcome]]], subfile[, 1]), ]
  if (num == 'worst') {
    subfile <- subfile[order(subfile[, 2], -subfile[, outcome_col[[outcome]]], subfile[, 1]), ]
  }
  if (!is.numeric(num)) {
    num <- 1
  }
  
  ## Return a data frame with the hospital names and the ## (abbreviated) state name
  temp <- split(subfile, subfile$State)
  temp <- lapply(temp, function(x) with(x, x[num, ]))
  
  ## Initiate an empty data frame
  df <- data.frame(hospital = character(), state = character())
  for (number in seq_along(state_list)) {
      df[number, 1] <- temp[[number]][[1]]
      df[number, 2] <- state_list[number]
  }
  df
}
