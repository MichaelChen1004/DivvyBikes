library(shiny)

somefunction <- function(inp) { }

shinyServer(
  someVar <- 1
  function(input, output) {
    output$oid1 <- renderPrint({input$id1})
  }
)