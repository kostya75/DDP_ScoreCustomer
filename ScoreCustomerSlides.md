Score Customer
========================================================
author: Konstantin Mingoulin
date: May 15th, 2016
autosize: true


Background
========================================================


To improve interactions with customers it was determined that it would make sense to segment them and come up with an individual approach for each segment. 

For the first part of the project the survey was conducted. The survey consisted of of 5 questions that evaluated customers' preferences for dealing with customers of their own. Results of the survey were clustered and labels were attached to each: 
- Customer Pleaser
- Efficient Operator
- Growth First

The second part involved scoring new customers that were not part of the original survey. Application was developed for scoring and is discussed further in this presentation. 

Please check the link below for the actual application <https://kostya75.shinyapps.io/ScoreCustomer/>


Scoring New Customers
========================================================

When visiting a new customer a sales rep would ask 5 questions:


<small>
1. It's important to me how I'm percieved in the community<br>
2. I'm always trying to undersatnd my customers' needs<br>
3. Making sure that the store is always properly stocked is important<br>
4. Getting a deal from a supplier is how they get my business<br>
5. I'm always looking for ways to attract new customers
</small>

Responses collected by the app and converted into a numeric vector. Some examples below:

```r
test_customer1<-c(5,5,3,2,1)
test_customer2<-c(1,1,3,4,5)
test_customer3<-c(2,3,3,2,3)
```

Scoring Function
=======================================================

```r
score<-function(response) {
    
    #Cluster centers. The estimates below could be an output of k-means procedure
    cluster_name<-c("Customer Pleaser", "Efficient Operator", "Growth First")
    cluster_coord1<-c(8,5,1); cluster_coord2<-c(1,3,8)
    
    #Linear combinations of responses used to score new observations
    #The estimates below could be an output of linear discriminant analysis
    dim1<-c(.8,.7,.3,.1,.3); dim2<-c(.3,.1,.3,.7,.8)
    
    #Estimate coordinates in 2D from lda for a new observation
    coord1<-sum(response*dim1); coord2<-sum(response*dim2)
    
    min_distance<-1000; index<-1
    
    #Find the distanse to the nearest cluster center and output the "label"
    for (i in 1:3) {
        distance<-sqrt((cluster_coord1[i]-coord1)^2+(cluster_coord2[i]-coord2)^2)
        if(min_distance>=distance) {
            min_distance=distance;index=i
        }
    }
   result<-cluster_name[index]} 
```


Evaluate Test Customers
==============================================


```r
print(score(test_customer1))
```

```
[1] "Customer Pleaser"
```

```r
print(score(test_customer2))
```

```
[1] "Growth First"
```

```r
print(score(test_customer3))
```

```
[1] "Efficient Operator"
```
