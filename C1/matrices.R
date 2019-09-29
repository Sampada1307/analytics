#Matrices
m= matrix(nrow = 2, ncol = 2)
m
#Dimension
dim(m)
m <- matrix(c(1:3))
class(m)
typeof(m)
m
#matrix filled row wise
mymatrix= matrix(1:6,nrow=3, byrow=TRUE, dimnames=list(c("d","e","f"),c("a","b")))
mymatrix
?matrix
1:24 #seq of values
(matrix= matrix(1:24, ncol=6, byrow=F))
(matrix= matrix(1:24, ncol=6, byrow=T))
(matrix= matrix(1:24, nrow=6, byrow=F))
(matrix= matrix(1:24, nrow=6, byrow=T))
(matrix= matrix(1:24, nrow=6, bycol=F))
(matrix= matrix(1:24, nrow=6, bycol=T))

1:24
(matrix= matrix(1:24, ncol=6, byrow=T))
length(1:24)
matrix[,1] #first columns
matrix[1,] #first rows
matrix[2:4,3:4] #2 to 4th rows, 3 to 4th column
matrix[2,3] #particular position
matrix
matrix[c(2,4),c(1,3)] #1th and 3rd column and 2nd and 4th column
#fill the values byrow not bycol
(matrix2= matrix(1:24, ncol= 4, byrow=TRUE))
#give names to columns and rows
(rn= paste('R',1:6, sep='-')) #sep= separator
?paste
cn= paste('c', 1:4, sep='-')
cn;rn
dimnames(matrix2)= list(c(rn),c(cn)) #dimnames- Dimension names
matrix2
#Rest in ds1.R