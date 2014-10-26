library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Hello, world!"),
  sidebarPanel(
    h3('Sidebar text')
  ),
  mainPanel(
    h3('Main Panel text')
  )
))