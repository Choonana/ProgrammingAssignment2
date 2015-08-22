## Put comments here that give an overall description of what your
## functions do

## This function creates a special 'matrix" function to set and get the value of the matrix and set and get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  s<-NULL
  set<-function(y){
    x<<-y
    s<<-NULL
  } 
  get<-function ()x
  setinverse <-function (solve) s<<-solve
  getinverse <-function() s
  list (set=set, get=get, 
        setinverse=setinverse, 
        getinverse=getinverse)  
}

## The next function calculates the inverse of the special matrix returned by the earlier function.

cacheSolve <- function(x, ...) {
  s<-x$getinverse()
  if(!is.null(s)){
    message("getting cached data")
    return(s)
  }
  data<-x$get()
  s<-solve(data,...)
  x$setinverse(s)
  s
}
