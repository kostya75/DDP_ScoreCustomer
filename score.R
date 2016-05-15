#function to score a new customer

#input tests
#categories
#Customer pleaser, efficient operator, growth oriented

#responses
#1 It's important to me how I'm percieved in the community
#2 I'm always trying to undersatnd my customers' needs
#3 Making sure that the store is always properly stocked is important
#4 Getting a deal from a supplier is how they get my business
#5 I'm always looking for ways to attract new customers

c1<-c(5,4,3,2,1)
c2<-c(1,2,3,4,5)

score<-function(response) {
    
    #cluster centers. The estimates below could be an output of k-means procedure
    cluster_name<-c("Customer Pleaser", "Efficient Operator", "Growth First")
    cluster_image<-list(img(src = "CP.png"),img(src = "EO.png"),img(src = "GF.png"))
    cluster_coord1<-c(8,4,1)
    cluster_coord2<-c(1,4,8)
    
    #linear combinations of responses used to score new observations. The estimates below
    #could be an output of linear discriminant analysis
    dim1<-c(.8,.7,.3,.1,.3)
    dim2<-c(.3,.1,.3,.7,.8)
    
    #estimate coordinates in 2D from lda for a new observation
    coord1<-sum(response*dim1)
    coord2<-sum(response*dim2)
    
    min_distance<-1000
    index<-1
    
    #find the distanse to the nearest cluster center for a new response and output the "label"
    for (i in 1:3) {
        
        distance<-sqrt((cluster_coord1[i]-coord1)^2+(cluster_coord2[i]-coord2)^2)
        if(min_distance>=distance) {
            min_distance=distance 
            index=i
        }
    }
   result<-list(cluster_name[index],cluster_image[index])
} 



