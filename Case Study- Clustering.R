#Clustering - Kmeans and Hierarchical Clustering using - Wine Data
#Clustering Case------
library(cluster)    #for visualisation
library(tidyverse)  # data manipulation
library(cluster)    # clustering algorithms
library(factoextra) # clustering visualization
library(dendextend) # for comparing two dendrograms
#load data-----
link = "https://raw.githubusercontent.com/DUanalytics/datasets/master/csv/wine.csv"
wine = read.csv(link)
head(wine)
#study the data-----
summary(wine)
str(wine)
#there are 3 types of wines
table(wine$Type)
#remove the type column and scale data
wine.stand <- scale(wine[-1])  # To standarize the variables
# Perform K-Means Clustering with 3 clusters
k.means.fit <- kmeans(wine.stand, center=3) # k = 3
#what are the attributes of Model
attributes(k.means.fit)
# What are Centroids values-----
k.means.fit$cluster
# Clusters: Which data into which cluster
k.means.fit$clust
# Cluster size: How many data points in which cluster
k.means.fit$size
clusplot(wine.stand, k.means.fit$cluster, main='2D representation of the Cluster solution', color=TRUE, shade=TRUE, labels=2, lines=0)
#evaluate the clustering performance
table(wine$Type,k.means.fit$cluster)
table(wine$Type)
table(k.means.fit$cluster)

  #Hierarchical Clustering------
#choose method - euclidean
d <- dist(wine.stand, method = "euclidean") # Euclidean distance matrix.
# create hclust using method=ward.D
H.fit <- hclust(d, method="ward.D")
#plot the dendogram
plot(H.fit) 
#cut the dendogram to 3 cluster
groups <- cutree(H.fit, k=3)
# draw dendogram with red borders around the 3 clusters
rect.hclust(H.fit, k=3, border="red") 
#see the grouping : compare with original
table(wine[,1],groups)
