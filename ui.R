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
  
  headerPanel("Chicago DivvyBikes Subscribers"),
  
  sidebarPanel( 
    checkboxGroupInput('gender', "Gender", c("M"="Male", "F"="Female"),
                       selected=c("Male","Female")),
    sliderInput('age', "Age", min=min(divvy$age), max=max(divvy$age),
                value=c(21,25), step=1),
    submitButton("Submit")
  ),
  
  mainPanel(
    h3('Trips Taken'),
    h3('Trip Duration'),
    plotOutput('plot2'),
    h3('Trip Start Times')
  )
))