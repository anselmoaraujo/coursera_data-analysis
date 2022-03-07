# 3 - Ranking hospitals by outcome in a state
#
# Write a function called rankhospital that takes three arguments: 
# the 2-character abbreviated name of a state (state), an outcome (outcome), 
# and the ranking of a hospital in that state for that outcome (num). 
# The function reads the outcome-of-care-measures.csv file
# and returns a character vector with the name of the hospital that has the
# ranking specified by the num argument. For example, the call 
# rankhospital("MD", "heart failure", 5) would return a character vector 
# containing the name of the hospital with the 5th lowest 30-day death rate for
# heart failure. The num argument can take values “best”, “worst”, or an integer
# indicating the ranking (smaller numbers are better). If the number given by
# num is larger than the number of hospitals in that state, then the function
# should return NA. Hospitals that do not have data on a particular outcome
# should be excluded from the set of hospitals when deciding the rankings.
#
# Handling ties. It may occur that multiple hospitals have the same 30-day
# mortality rate for a given cause of death. In those cases ties should be
# broken by using the hospital name. For example, in Texas (“TX”), the hospitals
# with lowest 30-day mortality rate for heart failure are shown here.

rankhospital <- function(state, outcome, num = "best") {
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
    ## Return hospital name in that state with the given rank
      # filter states
      subfile <- subfile[subfile$State == state, ]
      subfile <- subfile[order(subfile[, outcome_col[[outcome]]], subfile[, 1]), ]
    ## Convert function num argument to numeric
      if (num == 'best') {
        num <- 1
      } else if(num == 'worst') {
        num <- length(subfile[, outcome_col[[outcome]]][complete.cases(subfile[, outcome_col[[outcome]]])])
      }
      subfile[num, 1]
}
