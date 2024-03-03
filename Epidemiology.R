
#Installing and loading the appropriate package
install.packages('igraph')
library(igraph)



#-------------------------------------TASK 1--------------------------------------

#Reading in my data. I have included weight (edge length) and color. This is the
#complete edge list that I developed in Excel. The data is saved as a csv file
city_routes = read.table(file.choose(),header=TRUE,sep = ",")

#Developing a graph and plot from a data frame
data.frame(city_routes)
g=graph_from_data_frame(city_routes,directed = TRUE)
plot(g)

#Creating a new data frame with only the weight column. I don't need color right now
city_routes2 <- city_routes[c(1,2,3)]
data.frame(city_routes2)
g_with_weight = graph_from_data_frame(city_routes2,directed = TRUE)

#Developing an Edges List with weight only. (the edges list was developed as 
#a txt file and read in. This command specifies the "from" and "to" nodes, and 
#does not include the "colors" column by using the "g_with_weight" data from line
#18)
edgeslist=as_data_frame(g_with_weight,what = c("edges"))
edgeslist

#Developing an Adjacency Matrix (column names are suppressed to conserve space)
#There are some 2 values, as some edges with different colors go in the same
#direction between two nodes 
as_adjacency_matrix(g_with_weight)

#Developing a Stemmed Edges List. This will show all the connections for each 
#node, even if the nodes connect twice
stem = as_adj_list(g_with_weight,mode = "all",loops = "once", multiple = TRUE)
stem




#-----------------------------------TASK 2----------------------------------------

#Determining whether the graph is weak or strong connected (just by looking at the
#plot, we can establish that it is weak connected)

#Weak---> TRUE
is_connected(g_with_weight, c("weak"))
#Strong---> TRUE
is_connected(g_with_weight, c("strong"))
#We can assume now that there are no "breaks" in the graph

#Are there any articulation points?
#igraph generated 0/32 vertices as articulation points
articulation_points(g_with_weight)
#Are there any articulation edges (known as bridges in igraph)?
#igraph generated 0/93 edges as articulation edges (or bridges)
bridges(g_with_weight)
#We can now assume that there is no single vertex or edge that can be removed
#to disconnect the graph (Not to say that MULTIPLE vertices/edges can be removed
#to disconnect the graph)

#Determining the in-degree, out-degree, and degree of each vertex
#IN degree
degree(g_with_weight,V(g_with_weight),mode=c("in"),loops = TRUE, normalized = FALSE)
#OUT degree
degree(g_with_weight,V(g_with_weight),mode=c("out"),loops = TRUE, normalized = FALSE)
#ALL degrees
degree(g_with_weight,V(g_with_weight),mode=c("all"),loops = TRUE, normalized = FALSE)





#------------------------------------TASK 3--------------------------------------------

#AN EPIDEMIOLOGIST WANTS TO KNOCK OUT THE ---AIRPLANES--- (PURPLE/RED) EDGES ON THE MAP

#Creating a graph with no purple or red edges

noplanes =delete.edges(g, which(E(g)$color%in%c("purple","red")))
plot(noplanes)

#Developing an Edges List
no_planes_edgeslist=as_data_frame(noplanes,what = c("edges"))
no_planes_edgeslist

#Developing an Adjacency Matrix (column names are suppressed to conserve space)
as_adjacency_matrix(noplanes)

#Developing a Stemmed Edges List. This will show all the connections for each 
#node, even if the nodes connect twice
stem_noplanes = as_adj_list(noplanes,mode = "all",loops = "once", multiple = TRUE)
stem_noplanes

#Determining whether the graph is weak or strong connected

#Weak---> TRUE
#This means that there are no isolated cities resulting from knocking
#out the plane routes
is_connected(noplanes, c("weak"))

#Strong---> FALSE
#This means that there is opportunity to knock out other routes to completely
#isolate cities (in or out)
is_connected(noplanes, c("strong"))


#Are there any articulation points?
#igraph generated 1/32 vertices as articulation points
#We see that if Montreal is removed (or isolated), there will be a break in the
#network
articulation_points(noplanes)
#Are there any articulation edges (known as bridges in igraph)?
#igraph generated 0/79 edges as articulation edges
bridges(noplanes)
#We can now see that there is no single route that can be removed
#to break the network

#Determining the in-degree, out-degree, and degree of each vertex
#These degrees provide us with connection information for each city. We see that
#LA does not have any "in" degrees anymore, as these were all plane routes.
#IN degree
#IN degree
degree(noplanes,V(noplanes),mode=c("in"),loops = TRUE, normalized = FALSE)
#OUT degree
degree(noplanes,V(noplanes),mode=c("out"),loops = TRUE, normalized = FALSE)
#ALL degrees
degree(noplanes,V(noplanes),mode=c("all"),loops = TRUE, normalized = FALSE)






#AN EPIDEMIOLOGIST WANTS TO KNOCK OUT THE ---TRAINS--- (WHITE/BLUE) EDGES ON THE MAP


#Creating a graph with no white or blue edges

notrains =delete.edges(g, which(E(g)$color%in%c("blue","white")))
plot(notrains)

#Developing an Edges List
no_trains_edgeslist=as_data_frame(notrains,what = c("edges"))
no_trains_edgeslist

#Developing an Adjacency Matrix (column names are suppressed to conserve space)
as_adjacency_matrix(notrains)

#Developing a Stemmed Edges List. This will show all the connections for each 
#node, even if the nodes connect twice
stem_notrains = as_adj_list(notrains,mode = "all",loops = "once", multiple = TRUE)
stem_notrains

#Determining whether the graph is weak or strong connected

#Weak---> TRUE
#This means that there are no isolated cities resulting from knocking
#out the train routes
is_connected(notrains, c("weak"))

#Strong---> FALSE
#This means that there is opportunity to knock out other routes to completely
#isolate cities (in or out)
is_connected(notrains, c("strong"))


#Are there any articulation points?
#igraph generated 0/32 vertices as articulation points
articulation_points(notrains)
#Are there any articulation edges (known as bridges in igraph)?
#igraph generated 0/78 edges as articulation edges
bridges(notrains)
#We can now see that there is no single city or route that can be removed
#to break the network

#Determining the in-degree, out-degree, and degree of each vertex
#These degrees provide us with connection information for each city. We see that
#Hong Kong does not have any "in" degrees anymore, as these were all train routes.
#IN degree
degree(notrains,V(notrains),mode=c("in"),loops = TRUE, normalized = FALSE)
#OUT degree
degree(notrains,V(notrains),mode=c("out"),loops = TRUE, normalized = FALSE)
#ALL degrees
degree(notrains,V(notrains),mode=c("all"),loops = TRUE, normalized = FALSE)



#-----------------------------MY CONCLUSION------------------------------------------

#The epidemiologist initially wanted to knock out the planes, which eliminated
#any travel into LA ("in" degree = 0). They changed their mind and 
#decided to knock out the train routes instead. I can assume that the epidemiologist 
#did not intend to cut off entry into LA, otherwise eliminating plane routes would be 
#sufficient. So....

#The epidemiologist decided to knock out train routes instead. This eliminated any
#travel into Hong Kong ("in" degree = 0). This is the only city that didn't have 
#an "in" degree after knocking out the trains. The remaining cities all had "in"
#AND "out" degrees, showing that they are all connected bi-directionally. So, if 
#knocking out the trains is sufficient for the epidemiologist, we can assume that 
#their goal was to keep people from traveling into Hong Kong. 

#Maybe the epidemiologist lives in Hong Kong, and is trying to keep a disease
#out?