# title             :server.R
# description       :
# author            :rsml1729
# create-date       :2014-10-25
# usage             :RStudio
# notes             :


library(shiny)
library(ggplot2)
library(scales)
library(chron)

shinyServer(function(input, output) {

    divvyData <- reactive({
      subset(divvy, gender %in% input$gender & 
             age >= input$age[1] & age <= input$age[2])
    })
    
    output$plotTrips <- renderPlot({
      p <- ggplot(divvyData(), aes(x=as.Date(starttime))) + geom_histogram(binwidth=1) +
           xlab("Date") + ylab("Frequency") +
           ggtitle("Total DivvyBikes Trips Taken\n")
      print(p)
    }, height=400)
    output$TripsAvg <- renderText({
      divvyDailyFreqs <- as.data.frame(table(as.Date(divvyData()$starttime)))
      plotTripsAvg <- mean(divvyDailyFreqs$Freq)
    })
    
    output$plotDuration <- renderPlot({
      p <- ggplot(divvyData(), aes(x=tripduration)) + geom_histogram(binwidth=0.25) +
           scale_x_continuous(limits=c(0, 40)) + xlab("Trip Duration (m)") +
           ylab("Frequency") +
           ggtitle("DivvyBikes Trip Duration\n")
      print(p)
    }, height=400)
    
    output$plotDOW <- renderPlot({
      p <- ggplot(divvyData(), aes(x=weekdays(starttime))) + geom_histogram() +
           xlab("Day-of-Week") + scale_x_discrete(limits=c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")) +
           ylab("Frequency") +
          ggtitle("DivvyBikes Trip Day-of-Week\n")
      print(p)
    }, height=400)
})