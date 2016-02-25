library(shiny)

shinyUI(fluidPage(theme="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.6/superhero/bootstrap.css",
                  titlePanel("Media Network App"),
                  
                  sidebarLayout(
                          
                          
                          sidebarPanel(
                                  helpText(h4("Visualise the shortest path between two media in the network")),
                                  
                                  helpText("This application computes and visualises the shortest directed path 
                                           from the first node to the second in this media network."),
                                  
                                  helpText("The nodes of the network represent different news media, 
                                           both online and offline. The links represent either mentions or 
                                           hyperlinks."),
                                  
                                  helpText("Choose two different nodes using the drop-down lists below. 
                                           The shortest path is automatically computed and visualised in 
                                           the graphic on the right."),
                                  
                                  selectInput("node1", 
                                              label = "Choose the first media",
                                              choices = c("NY Times", "Washington Post", "Wall Street Journal",
                                                          "USA Today", "LA Times", "New York Post", "CNN", 
                                                          "MSNBC", "FOX News", "ABC", "BBC", "Yahoo News",
                                                           "Google News", "Reuters.com", "NYTimes.com", 
                                                          "WashingtonPost.com", "AOL.com"),
                                              selected = "NY Times"),
                                  
                                  selectInput("node2", 
                                              label = "Choose the second media",
                                              choices = c("NY Times", "Washington Post", "Wall Street Journal",
                                                          "USA Today", "LA Times", "New York Post", "CNN", 
                                                          "MSNBC", "FOX News", "ABC", "BBC", "Yahoo News",
                                                          "Google News", "Reuters.com", "NYTimes.com", 
                                                          "WashingtonPost.com", "AOL.com"),
                                              selected = "Washington Post"),
                                  
                                  helpText(em("Data source:", a(href = "http://kateto.net/network-visualization",
                                              "kateto.net")))
                          ),
                          
                          
                  
                          mainPanel(
                                  plotOutput("p")
                                  )
                )
))


