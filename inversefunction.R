## fUNCIÓN

makeCacheMatrix <- function(x = matrix()){
  u<- NULL
  set<- function(y) {
    x<<- y
    u<<- NULL
  }
  
  get<- function()x 
  setinverse<- function(inverse) u <<- inverse
  getinverse<- function() u
  list( set = set, get = get,
        setinverse= setinverse,
        getinverse= getinverse)
}

#### Here we have ouer matrix
z <- matrix(c(2,2,4,5), ncol = 2, nrow = 2)
Z <- makeCacheMatrix(z)

## Calculará la inversa de una Matriz alimentad/ we calculate it with inverse function

cacheSolve <- function(x, ...) {
  u<- x$getinverse()
  if(!is.null(u)) {
    message("ya lo tienes guardado/you already have the inf/Du hast die informationen")
    return(u)
  }
  data<- x$get()
  u<- solve(data, ...)
  x$setinverse(u)
  u
}