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
