## Put comments here that give an overall description of what your functions do
## Week3 assignment
## Write a short comment describing this function


makeCacheMatrix <- function(x = matrix()) {
## define the argument with default mode of "matrix"
  inv <- NULL  ##initialize inv as NULL; will hold value of matrix inverse
  set <- function(y){  ##define the set function to assign new value of matrix in parent envrionment
    x <<- y  ##value ofmatrix in parent environment
    inv <<- NULL  ##if there is a new matrix, reset inv to NULL
  }
  get <-function () x  ##define the get function - returns value of the matrix argument
  
  setinverse <-function (inverse)inv<<-inverse  ##assign value of inv in parent environment
  getinvese <- function () inv  ##gets the value of inv where called
  list (set = set, get = get, setinverse = setinverse, getinverse = getinverse)  
}

## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## if the inverse has already been calculated (and the matrix has not changed),
## the cacheSolve will retrieve the inverse from the cache


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <-x$getinverse()
  if(!is.null(inv)) {
    message ("getting cached data")
    return(inv)
  }
  data<- x$get()
  inv<- solve(data,...)
  x$setinverse(inv)
  inv
}
