# Programming Assignment 2
# ========================
# 
# 
# The first function, makeCacheMatrix creates a special "matrix" object, 
# that can cache its inverse.
# 
# set the value of the matrix
# get the value of the matrix
# set the value of the matrix
# get the value of the matrix

makeCacheMatrix <- function(x = matrix()) {
    stopifnot(is.matrix(x))
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) m <<- inverse
    getInverse <- function() m
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

# This function computes the inverse of the special "matrix object,
# assuming the input is invertible.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getInverse()
    if(!is.null(m)) {
        message('getting cached data')
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)
    m
}
