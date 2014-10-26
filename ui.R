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
  
  headerPanel("Chicago DivvyBikes 2013"),
  
  sidebarPanel( 
    img(src="http://discounts.depaul.edu/images/vendorlogos/Divvy%20Bikes.png"),
    p("The city of Chicago started a bike-sharing program, DivvyBikes, in the summer of 2013.
       DivvyBikes released an anonymized dataset of trips taken in 2013. Use this tool to explore
       what kind of trips DivvyBikes riders took!"),
    p("Toggle the Gender selection and Age range below, then click 'Submit' to see the relevant rider stats."),
    checkboxGroupInput('gender', "Gender", c("M"="Male", "F"="Female"),
                       selected=c("Male","Female"), inline=T),
    sliderInput('age', "Age", min=min(divvy$age), max=62,
                value=c(21,25), step=1),
    submitButton("Submit")
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Total Trips",
               plotOutput('plotTrips'),
               p("Average Daily Trips Taken: ", textOutput('TripsAvg'))),
      tabPanel("Duration", plotOutput('plotDuration')),
      tabPanel("Day-of-Week", plotOutput('plotDOW')),
      tabPanel("Notes", 
               p("DivvyBikes data is publicly available at the", 
               a(href="https://www.divvybikes.com/datachallenge", "2014 Divvy Data Challenge"),"."),
               p("The full dataset includes both annual subscribers and one-day pass riders. 
                 For the analysis in this Shiny app, only subscribers are included."),
               img(src="http://farm8.staticflickr.com/7395/10713925703_fe48c26291.jpg")
      )
    )
  )
))