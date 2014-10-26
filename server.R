# title             :server.R
# description       :
# author            :rsml1729
# create-date       :2014-10-25
# usage             :RStudio
# notes             :


library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

    divvyData <- reactive(function() {
      divvy[divvy$gender %in% input$gender,]
    })
    
    output$plot1 <- renderPlot(function() {
      p <- ggplot(divvyData(), aes(x=))
    })
    
    output$plot2 <- renderPlot(function() {
      p <- ggplot(divvyData(), aes(x=tripduration)) + geom_histogram() +
           scale_x_continuous(limits=c(0, 40)) + xlab("Trip Duration (m)") +
           ylab("Frequency")
      print(p)
    }, height=200)
})