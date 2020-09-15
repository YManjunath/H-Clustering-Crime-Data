#loading the data 
data=read.csv(file.choose())
View(data)
crime=data[,(2:5)] #excludiing the first column
View(crime)

#normalizing the data
norm=scale(crime)
View(norm)

#applying the distance matrix
d=dist(norm,method = 'euclidean')
fit=hclust(d,method ='complete')#creating the dendogram
plot(fit,hang=-1)

#we need to cut the dendogram according our requirment and problem
groups=cutree(fit,k=5)#k=number of clusters we want
table(groups)
#label the clusters
crime_rate=as.matrix(groups)

#creating a column and storing the cluster values in it
final=data.frame(data,crime_rate)
View(final)

#bringing the final column to first column
final1=final[,c(ncol(final),1:(ncol(final)-1))]
View(final1)

#finding the mean of the data
aggregate(crime,list(final$crime_rate),mean)
