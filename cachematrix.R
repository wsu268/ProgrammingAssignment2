## Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than 
compute it repeatedly. The following pair of functions cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {

## initialize the inverse value to null  
z <- NULL

## set the matrix value
set <- function(y) {
x <<- y
z <<- NULL
}
  
## get the matrix value
get <- function() x

## set the inverse
setz <- function(soln) z <<- soln
	
## get the inverse
getz <- function() z
  	
## return a list for the above functions
list(set = set, get = get, setz = setz, getz = getz)

}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been 
calculated (and the matrix has not changed), then the cachesolve will retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {

## check if inverse is already cached
z <- x$getz()
if(!is.null(z)) {
message("get cached data")
return(z)}

## not cached, so get matrix into data  
data <- x$get()

## compute inverse
z <- solve(data, ...)
  
## cache inverse
x$setz(z)

## Return a matrix that is the inverse of 'x'
z

}