library(shiny)

# Define UI for the application
ui <- fluidPage(
  
  # Application title
  titlePanel("Probability Problems"),
  
  # Main content
  mainPanel(
    h3("Select a file to view:"),
    uiOutput("file_links")
  )
)

#-------------------------------------------------------------------------------

# Define server 
server <- function(input, output, session) {
  
  # Generate clickable list of files
  output$file_links <- renderUI({
    tags$ul(
      tags$li(a(href = "/problems_repository/birthday_problem.html", "Birthday Problem", target = "_blank")),
    )
  })
}

#-------------------------------------------------------------------------------

# Run the application
shinyApp(ui = ui, server = server)

