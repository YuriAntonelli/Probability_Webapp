library(shiny)

# Define server logic
server <- function(input, output, session) {
  
  # Render the selected problem HTML file
  output$markdown <- renderUI({
    req(input$problem)  # Ensure that a problem is selected
    
    # Read and include the selected HTML file
    content <- includeHTML(input$problem)
    
    # Wrap content in a div and trigger MathJax if needed
    tagList(
      div(HTML(content)),
      tags$script("MathJax.Hub.Queue(['Typeset', MathJax.Hub]);")  # Trigger MathJax if necessary
    )
  })
}