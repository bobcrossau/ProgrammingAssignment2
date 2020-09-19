makeCacheMatrix <- function(input = matrix()) {
  inverse <- NULL # define a variable
  # the function is input as a variable by the 'cacheSolve' 
  # function to so that the time-consuming calculation of
  # an inverse matrix can be used repeatedly. The function
  # holds four functions - set, get, setinverse & getinverse.
  # Code defines 1st function: set() enables later input
  set <- function(matx) { 
    input <<- matx  # assigns input in the parent environment
    inverse <<- NULL # assigns NULL value in the parent environment
  }
  # Code defines 2nd function: the getter for the input matrix
  get <- function()input
  # Code defines 3rd function: the setter for the inverse matrix
  setinverse <- function(solve) inverse <<- solve
  # Code defines 4th function: the getter for the inverse matrix
  getinverse <- function()inverse
  # create a 'special' object that is each of the four functions 
  # in a list. The object is held in memory in the parent environment
  # rather than being cleaned up by the garbage collector. The 
  # functions in the list can be later accessed in the cacheSolve
  # function by name using $ rather than a less elegant [[ form.
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

cachesolve <- function(func, ...) {
  # The purpose of this function is to return a previously  
  # cached inverse matrix. The function takes as its input  
  # the 'makeCacheMatrix' function, which has cached in the 
  # parent environment an object with functions for use by 
  # this function.
  # First it accesses the inverse matrix in memory
  invmat <- func$getinverse()
  # If it isn't NULL - i.e. it's a valid result
  # it returns the inverse matrix and the function ends.
  if(!is.null(invmat)) {
    message("getting cached data")
    return(invmat)
  }
  # If a correct inverse matrix is unavailable it gets 
  # the input matrix ...
  data <- func$get()
  # and solves it ...
  invmat <- solve(data, ...)
  # and returns the solution to the parent environment
  func$setinverse(m)
  # and prints the inverse matrix
  invmat
}
