# Function to create a special matrix object that caches its inverse
makeCacheMatrix <- function(matrix = matrix()) {
  # Initialize a variable to store the inverse
  inverse <- NULL
  
  # Function to set the matrix
  set <- function(new_matrix) {
    matrix <<- new_matrix
    # When a new matrix is set, invalidate the cached inverse
    inverse <<- NULL
  }
  
  # Function to retrieve the matrix
  get <- function() {
    matrix
  }
  
  # Function to compute and cache the inverse of the matrix
  cacheInverse <- function() {
    if (!is.null(inverse)) {
      # If the inverse is already computed, return the cached value
      message("Getting cached inverse")
      return(inverse)
    } else {
      # Compute the inverse using solve() function
      message("Computing inverse")
      inv <- solve(matrix)
      inverse <<- inv  # Cache the inverse
      return(inv)
    }
  }
  
  # Return a list of functions
  list(set = set, get = get, cacheInverse = cacheInverse)
}

# Function to compute the inverse of the cached matrix
cacheSolve <- function(matrix) {
  matrix$cacheInverse()
}
