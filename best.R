# Write a function called 'best' that take 2 arguments:
#   - 2-char abbreviated name of a state and;
#   - an outcome names
# The function reads the csv and returns a char vector with the name
# of the hospital that has the best (lowest) 30-day mortality for the specified
# outcome in that state.
# The hospital name is the name provided in the Hospital.Name variable.
# The outcomes can be one of 'heart attack', 'heart failure' or 'pneumonia'.
# Hospitals that do not have data on a particular outcome should be excluded
# from the set of hospital when deciding the rankings.
# 
# If there is a tie for the best hospital for a given outcome, then the hospital
# names should be sorted in alphabetical order and the first hospital in that 
# set should be chosen

best <- function(state, outcome) {
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
    ## Check state validity
      if (nchar(as.character(state)) != 2 | !(state %in% state_list)) {
            stop('invalid state')
      }
    ## Check outcome validity
      if (!(as.character(outcome) %in% outcome_list)) {
            stop('invalid outcome')
      }
    ## Return hospital name in that state with lowest 30-day death rate
      # filter states
      subfile <- subfile[subfile$State == state, ]
      subfile <- subfile[order(subfile[, outcome_col[[outcome]]], subfile[, 1]), ]
      subfile[1, 1]
}
