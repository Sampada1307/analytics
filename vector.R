#Vector
#have only one kind of data- numeric, character, logical or integer
# c()-- c means concatenation
#numeric
x= c(2,3,4)
x
class(x)
#character
y= c('a', 'b', 'c')
y
#logical
z= c(TRUE, TRUE, FALSE, FALSE)
z
#integers
a= c(1L, 2L, 3L)
a
class(a)
length(a)
typeof(a)
str(a)
?attributes
attributes(a)
#adding element to vector
y= c(y, 'd')
y
#vectors from a sequence of Numbers
series= 1:10
series
seq(10)
seq(1,10,1.5)
#missing values in vector
#is.na
#anyNA
u= c('a', 'c' ,NA, 'd')
v= c(4, 6, 8, NA, 9)
k= c(1.5, NA, 1.8)
s= c(1, 2, 3, 4, 5)
is.na(u)
is.na(k)
anyNA(v)
anyNA(s)
#slicing a vector:
#We can select one or many elements from a vector by using the square brackets[]
series[4]
y[3]
g=20:50
g
length(g)
k= seq(1, 10, 1.5)
k
k[5] #showing the fifth element on the vector
k[1:5] #showing the elements on the vector
g[c(1,3)]
