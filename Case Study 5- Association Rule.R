#AR using Transaction Data : Buy PC
#Assignment------
#load Data
link="https://raw.githubusercontent.com/DUanalytics/datasets/master/csv/buyPC.csv"
buy <- read.csv(link)
head(buy)

#libraries----
library(ggplot2)
library(dplyr)
library(arules)
library(arulesViz)

#plot : Buy - credit rating wrt age_gp
ggplot(data=buy, aes(x=Age_Gp, fill=Income)) + geom_bar(stat='count') + geom_text(stat='count', aes(label=..count..), size=rel(4), vjust=+2, position = position_stack()) +  facet_grid(Credit_Rating ~ Buys_PC, scales='free')

#transaction format
ardata = as(buy, 'transactions')
ardata

#itemfreq- plot-----
itemFrequency(ardata)
itemFrequencyPlot(ardata)
itemFrequencyPlot(ardata,  type='absolute', topN=5)
#freq items set with min support=.2 and minlen=2
fset1 = eclat(data=ardata, parameter = list(support=.2, minlen=2))
fset1
inspect(fset1)
#view frequent item set in decreasing order
inspect(sort(fset1, decreasing = T))

#create rules: support=.2, confidence=.6
rules = apriori(data=ardata, parameter = list(support=.2, confidence=.8, minlen=2))
rules
options(digits=3)
inspect(rules)

#Display first 5 rule : Sort by confidence
inspect(sort(rules, by='confidence')[1:5])
#any redundant rule
rules[is.redundant(rules)]
#remove them
NRrules = rules[!is.redundant(rules)]
inspect(NRrules)
#Find rules which have RHS: Buys_PC=Yes
NRrules_buyYes <- subset(NRrules, subset = rhs %in% "Buys_PC=Yes")
inspect(NRrules_buyYes)
inspect(sort(NRrules_buyYes, by='confidence')[1:5])
labels(sort(NRrules_buyYes, by='confidence')[1:5])
#which items on LHS predict high confidence of purchase and high correlation
ANS.: # [1] "{Age_Gp=Youth,Income=Low} => {Buys_PC=Yes}"        
# [2] "{Age_Gp=Youth,Student=Yes} => {Buys_PC=Yes}"       
# [3] "{Age_Gp=Middle_Age,Income=Medium} => {Buys_PC=Yes}"
# [4] "{Student=Yes,Credit_Rating=Fair} => {Buys_PC=Yes}" 
# [5] "{Student=Yes} => {Buys_PC=Yes}" 

#find out rules with Young people
inspect(subset(NRrules, subset = lhs %in% 'Age_Gp=Youth'))
#plot rules
plot(NRrules, pch=24, bg='black', lwd=2, cex=1, jitter=T)  
plot(NRrules, method="paracoord", control=list(reorder=TRUE))
plot(NRrules, method = "grouped")
#What is your recommendations: which type of people buy: I think, the people with LOW-INCOME and is a Student can buy PC, as the lift is high for both of this.


