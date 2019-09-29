# comment to explain your code
mtcars #control+enter
?mtcars
?mean
class(mtcars)
summary(mtcars) #summary of data
str(mtcars)
table(mtcars$gear)
table(mtcars$cyl)
table(mtcars$vs)
table(mtcars$cyl, mtcars$gear, mtcars$vs)
table(mtcars$cyl, mtcars$gear, dnn= c("cyl","gear"))
