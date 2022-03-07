# Loop Functions
# Splitting a Data Frame
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c('Ozone', 'Solar.R', 'Wind')]))
sapply(s, function(x) colMeans(x[, c('Ozone', 'Solar.R', 'Wind')], na.rm = TRUE))

# Splitting on More than One Level
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1
f2
interaction(f1, f2)

str(split(x, list(f1, f2)))
