#####################################################################################################
##  Matrix inversion is usually a costly computation and there may be some benefit to caching the  ##
##  inverse of a matrix rather than computing it repeatedly.                                       ##
##                                                                                                 ##
##  Below pair of functions cache the inverse of a matrix.                                         ##
#####################################################################################################

##
## This function creates a special "matrix" object that can cache its inverse.
##
## 
makeCacheMatrix <- function(x = matrix()) {

    c <- NULL # initalize 
    
    # create the matrix 
    set <- function(y) {
        x <<- y
        c <<- NULL
    }
    
    get <- function() x # Get matrix value
    
    
    setMatrix <- function(inverse) c <<- inverse ### invert the matrix and store in cache
    
    getInverse <- function() c  ###get inverted matrix from cache
    
    # returns the functions
    list(set = set, get = get,
         setMatrix = setMatrix,
         getInverse = getInverse)
    
    
}


##
## `This function computes the inverse of the special "matrix" returned by `makeCacheMatrix` above. 
##  If the inverse has already been calculated (and the matrix has not changed), then `cacheSolve` 
##  should retrieve the inverse from the cache.
##
## Assumptions Given: Matrix supplied is always invertible.
## 
cacheSolve <- function(x, ...) {
    
    c <- x$getInverse()
    
    # If inverted matrix in cache(not NULL) return it
    if (!is.null(c)) {
        
        message("getting cached data")
        return(c)
    }

    
    matrix <- x$get() # create matrix
    
    
    c <- solve(matrix, ...)   # Computing the inverse of a square matrix
    
    x$setMatrix(C)        # set inverted matrix in cache

    return (c)
}
