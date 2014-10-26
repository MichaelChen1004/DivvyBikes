# title             :ui.R
# description       :
# author            :rsml1729
# create-date       :2014-10-25
# usage             :RStudio
# notes             :

library(shiny)
library(ggplot2)

divvyData <- divvy

shinyUI(pageWithSidebar(
  
  headerPanel("Chicago DivvyBikes 2013 Subscribers"),
  
  sidebarPanel( 
    checkboxGroupInput('gender', "Gender", c("M"="Male", "F"="Female"),
                       selected=c("Male","Female")),
    sliderInput('age', "Age", min=min(divvy$age), max=62,
                value=c(21,25), step=1),
    submitButton("Submit")
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Total Trips", plotOutput('plotTrips')),
      tabPanel("Duration", plotOutput('plotDuration')),
      tabPanel("Day-of-Week", plotOutput('plotDOW'))
    )
  )
))