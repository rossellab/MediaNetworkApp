library(shiny)
library(igraph)

# read the data
nodes <- read.csv("data/Dataset1-Media-Example-NODES.csv", header=T, as.is=T)
links <- read.csv("data/Dataset1-Media-Example-EDGES.csv", header=T, as.is=T)

# aggregate the links with the same from and to nodes
links <- aggregate(links[,3], links[,-3], sum)
links <- links[order(links$from, links$to),]
colnames(links)[4] <- "weight"
rownames(links) <- NULL

# create the network object and plot it
net <- graph.data.frame(links, nodes, directed=T)
net <- simplify(net, remove.multiple = F, remove.loops = T)
l <- layout.auto(net)

shinyServer(function(input, output) {
        
        output$p <- renderPlot({
        
        # compute shortest path between the selected nodes
        news.path <- get.shortest.paths(net, V(net)[media == input$node1], 
                                        V(net)[media == input$node2],
                                        mode = "out", output = "both")
                
        # Generate edge color variable:
        ecol <- rep("gray80", ecount(net))
        ecol[unlist(news.path$epath)] <- "gold"
        
        # Generate edge width variable:
        ew <- rep(2, ecount(net))
        ew[unlist(news.path$epath)] <- 4
        
        # Generate node color variable:
        vcol <- rep("gray40", vcount(net))
        vcol[unlist(news.path$vpath)] <- "orange"
        
        plot(net, layout = l, vertex.shape = "none", vertex.label = V(net)$media, vertex.label.font = 2, vertex.label.color = vcol,
             vertex.label.cex = .9, edge.color = ecol, edge.width = ew, edge.arrow.size = .6, edge.curved = .15)
        
        })

}
)

