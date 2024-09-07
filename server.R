# server.R

library(shiny)

server <- function(input, output, session) {
  output$markdown <- renderUI({
    content <- includeHTML(input$problem)
    
    # Return the content wrapped in a div and trigger MathJax after rendering
    tagList(
      tags$div(HTML(content)),
      tags$script("MathJax.Hub.Queue(['Typeset', MathJax.Hub]);")
    )
  })
}
