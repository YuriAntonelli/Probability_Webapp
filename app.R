library(shiny)

# Define the UI
ui <- fluidPage(
  tags$head(
    tags$script(src = "https://cdn.jsdelivr.net/npm/mathjax@2.7.9/MathJax.js?config=TeX-AMS-MML_HTMLorMML")
  ),
  
  titlePanel("Select a Problem to View"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "problem", 
        label = "Choose a problem:", 
        choices = c("Monty Hall Problem" = "problems_repository/monty_hall.html",
                    "Birthday Problem" = "problems_repository/birthday_problem.html",
                    "Newton Pepys Problem" = "problems_repository/newton_pepys_problem.html",
                    "St Petersburg" = "problems_repository/st_petersburg.html",
                    "The Montmort Problem" = "problems_repository/the_montmort_problem.html")
      )
    ),
    
    mainPanel(
      # Div to display the selected HTML content
      uiOutput("markdown")
    )
  )
)

# Define the server logic
server <- function(input, output, session) {
  output$markdown <- renderUI({
    # Read the HTML content
    content <- includeHTML(input$problem)
    
    # Return the content wrapped in a div and trigger MathJax after rendering
    tagList(
      tags$div(HTML(content)),
      tags$script("MathJax.Hub.Queue(['Typeset', MathJax.Hub]);")
    )
  })
}

# Run the application
shinyApp(ui = ui, server = server)
