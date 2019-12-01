#Batch, age, gender, cgpa, ug markrs, 12th class marks: salary
nS=200
(age=round(runif(n=nS, min=20, max=30)))
mean(age)
(gender=sample(x=c('M','F'), size=nS, replace=T, prob=c(.7,.3)))
table(gender)
(batch=sample(x=c('2017','2018',2019), size=nS, replace=T, prob=c(.2,.3,.5)))
table(batch)
(cgpa=round(rnorm(n=nS, mean=7,sd=.75),2))
range(cgpa)
(ug=round(rnorm(n=nS, mean=70,sd=5),2))
range(ug)
(class12=round(rnorm(n=nS,mean=70,sd=7),2))
range(class12)
(domain=sample(c('Finance','HR','Operations','Marketing'),size=nS, replace=T))
students=data.frame(age,gender,batch,domain,cgpa,ug,class12)
head(students)
(students$select=sample(c('Place','Not Placed'), size=nS, replace=T, prob=c(.7,.3)))
table(students$select)
(students$salary=round(rnorm(n=nS,mean=12,sd=1),2))
(students$salary=ifelse(students$select=='Not Placed', NA, students$salary))
head(students)
hist(cgpa)
barplot(ug)

#summarize
nrow(students) #no of students
table(students$domain)
table(students$batch)
table(students$batch, students$domain)
table(students$batch, students$domain, students$gender)
hist(students$cgpa)
hist(students$cgpa, breaks=c(0,6.5,8.5,10)) #0 to 6.5, 0 to 8.5 and 0 to 10-break
hist(students$age)
hist(students$age, breaks=c(20,24,26,30))

#dplyr is for data summarization.
library(dplyr)
library(ggplot2)
t1<-students %>% group_by(gender) %>% summarise(meanAge=mean(age))
barplot(height=t1$meanAge)

ggplot(students, aes(x=gender, fill=gender))+geom_bar(stat='count') #No text
#GENDER
ggplot(students, aes(x=gender, fill=gender))+geom_bar(stat='count')+geom_text(stat='count',aes(label=..count..)) #aesthetics and with labels and texts
#DOMAIN
ggplot(students, aes(x=domain, fill=gender))+geom_bar(stat='count')+geom_text(stat='count',aes(label=..count..))
#BATCH
ggplot(students, aes(x=batch, fill=gender))+geom_bar(stat='count')+geom_text(stat='count',aes(label=..count..))
#WE DID NOT DO IT FOR AGE AS THERE COU;D BE MANY AGES WHICH WOULD NOT CREATE A PROPER GRAPH AND THERE WILL ALSO BE A POSSIBILITY THAT THE AGES COMES IN POINTS, WHICH WOULD NOT SHOW A CORRECT GRAPH.

ggplot(students, aes(x=batch, fill=domain))+geom_bar(stat='count')+geom_text(stat='count',aes(label=..count..))
ggplot(students, aes(x=batch, fill=domain))+geom_bar(stat='count')+geom_text(stat='count',aes(label=..count..),position = position_stack()) #In the above code, the labels were overlapping, so to remove that we  used position.
ggplot(students, aes(x=batch, fill=domain))+geom_bar(stat='count')+geom_text(stat='count',aes(label=..count..),position = position_stack(), vjust=1) #We did the labelling correct but it was going out of graph, so set a limit of 1 by vjust, ie., vertical adjust
ggplot(students, aes(x=batch, fill=domain))+geom_bar(stat='count')+geom_text(stat='count',aes(label=..count..),position = position_stack(), vjust=1)+facet_grid(~gender) #includede gender as well, first Female and then male being in alphabatical order
ggplot(students, aes(x=batch, fill=domain))+geom_bar(stat='count')+geom_text(stat='count',aes(label=..count..),position = position_stack(), vjust=1)+facet_grid(select~gender) #select has helped to find all the criteria.

ggplot(students, aes(x=gender, fill=gender))+geom_bar(stat='count')+geom_text(stat='count',aes(label=..count..),position = position_stack(), vjust=1)+facet_grid(batch~domain)

#histogram
students
ggplot(students, aes(x=cgpa))+geom_histogram()
ggplot(students, aes(x=cgpa))+geom_histogram(breaks=c(0,5,7,9,10), fill=1:4)
ggplot(students, aes(x=cgpa))+stat_bin(bins=5, fill=1:5)

ggplot(students, aes(x=gender, fill=gender))+geom_bar(stat='count')+geom_text(stat='count',aes(label=..count..))+facet_grid(batch~domain,scale='free')

students %>% group_by(batch, domain) %>% summarize(avgsal=mean(salary, na.rm=T))
head(students)
students %>% filter(batch=='2018' & select=='Place') %>% group_by(domain, gender) %>% summarise(meanSal=mean(salary, na.rm=T))


                                                                                          