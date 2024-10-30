# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix())  { # x defaults to empty matrix
        inv <- NULL #Initialize inverse
        set <- function(y){
                x <<- y #Assign mew matrix to x
                inv <<- NULL #Reset inverse cache
        }
        get <- function() {
                x #Return the matrix
        
        }
        setInverse <- function(inverse){
                inv <<- inverse #Cache the inverse, stores computed inverse
        }
        getInverse <- function(){
                inv #Return the cache inverse
        }
        }
        

# cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.  It returns a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
        inv <- x$getInverse #Check first if inverse is cached
        if(!is.null(inv)){
                message("cached inverse:\n")
                return(inv) #if already cached, then return the cached inverse
                }
        else { #if inv is not already cached, do the calculation
                data <- x$get() #get the matrix
                inv <- solve(data, ...) #Compute Inverse of matrix using solve
                x$setInverse(inv) #Cache the inverse
                }
        inv #return the inverse
}

