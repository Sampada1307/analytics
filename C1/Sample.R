#sample
set.seed(1234) #to get random numbers
sample(1:10)
LETTERS[1:26]
sample(LETTERS[1:26]) #to get random letters
?sample #understand by using this 
sample(x=LETTERS[1:26], size=100)
sample(x=LETTERS[1:26], size=100, replace=TRUE) #repetition even after the 26th letter and will show the 100th letter
sample(x=LETTERS[1:26], size=100, replace=T)
gender= c('M','F')
gender
sample(x=gender)
sample(x=gender, size=100) #error
sample(x=gender, size=100, replace=T)
x= sample(x=gender)
x=sample(x=gender, size=100, replace=T)
x
table(x)
x2= sample(x=gender, size= 1000, replace=T, prob=c(.4,.6))
table(x2)

course= c('MBA','BBA')
course
x3= sample(x=course)
x3
x3= sample(x=course, size=1000, replace=T, prob=c(.6,.4))
table(x3)

set.seed(1234) #to get the same answers for everyone or giving a specific root for everyone
course= c('MBA','BBA')
course
x3= sample(x=course)
x3
x3= sample(x=course, size=1000, replace=T, prob=c(.6,.4))
table(x3)
