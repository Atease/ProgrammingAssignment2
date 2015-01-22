## This pair of function is meant to make sure that the inverse of a matrix is only calculated once and saved in cache.  
## When needed later, they can be retrieved through cache instead of being recalculated.

## makeCacheMatrix is to create a list of special vectors that can: set and get value of the matrix & its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x ##function of getting x
  setinv<-funtion(inverse), m<<-inverse ##setting the inverse matrix
  getinv<-function(m)
    list(set=set, get=get,setinv=setinv,getinv=getinv)

}


## The following function calculates the inverse of the special"matrix" returned by makeCacheMatrix above.  
## if the inverse has been calculated, the cacheSolve function will retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  m<-x$getinv()
  if(!is.null(m)){
    message("getting cached data")
    return(m) ## Return the inverse of 'x' from the cache
  }
  data<-x$get() ##getting the matrix
  m<-solve(data) ##calculating the inverse of the matrix
  x$setinv(m) ##send the result to cache for future use
  m  ## Return a matrix that is the inverse of 'x'
}
