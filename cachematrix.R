## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## A function that represents a matrix that can cache its inversion. Really a list of functions. 
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL;
  set <- function(y) {
    x <<- y
    i <<- NULL;
  }
    
  get <- function() x
  setinv <- function(inv) i <<- inv
  getinv <- function() i  
  
  list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## Write a short comment describing this function
## Using the cacheable matrix above, will store and cache upon first call 
## and use cached inverted matrix on subsequent calls.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if (!is.null(inv)) {
    inv
  } else { 
    x$setinv(solve(x$get(), ...))
    x$getinv()
  }
}
