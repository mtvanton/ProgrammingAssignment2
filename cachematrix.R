## Put comments here that give an overall description of what your
## functions do
# week 3 assignment - R programming
# john hopkins at coursera


## Write a short comment describing this function
# According to Dr. Peng's instruction, this function should have
# 1. set the value of the vector
# 2. get the value of the vector
# 3. set the value of the mean
# 4. get the value of the mean


makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  
  get <- function() {
    x
  }
  setinverse <- function(test) {
    inverse <<- test
  }
  getinverse <- function() {
    inverse
  }
  list(set=set, get=get,
       setinverse=setinverse,
       getinverse=getinverse)
}

#mean calculation is not the right logic, but works for this purpose
testVector <- makeCacheMatrix()
x <- 1:4

testVector$set(x)
testVector$get()
testVector$setinverse(89)
testVector$getinverse()

?solve
## Write a short comment describing this function
# According to Dr. Peng's instruction, this function should have
# The following function calculates the mean of the special "vector" created with the above function. 
# However, it first checks to see if the mean has already been calculated. If so, it gets the mean from the cache and skips the computation. Otherwise, it calculates the mean of the data and sets the value of the mean in the cache via the setmean function.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse()
  
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  
  data <- x$get()
  inverse <- solve(data, ...)
  x$setinverse(inverse)
  inverse

}

#how to test it
cacheSolve(testVector)


