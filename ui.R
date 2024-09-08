library(shiny)
library(bslib)

# Define the path to the problems directory
problems_path <- "problems_repository/html_files/"

# Dynamically get the list of HTML files from the directory
problem_files <- list.files(problems_path, pattern = "\\.html$", full.names = FALSE)

# Remove the ".html" extension and format problem names for the dropdown
problem_names <- gsub("\\.html$", "", problem_files)
problem_choices <- setNames(paste0(problems_path, problem_files), gsub("_", " ", problem_names))

# Define UI
ui <- fluidPage(
  theme = bs_theme(version = 4, bootswatch = "flatly"),
  
  navbarPage(
    title = div(icon("calculator"), "Probability App"),
    
    # Home page tab
    tabPanel(
      title = "Home",
      fluidRow(
        column(12,
               div(class = "main-panel", 
                   h2("Welcome to the Probability Problems App!"),
                   p("This app features a collection of famous probability problems, each accompanied by both an analytical and simulated solution."),
                   p("To begin, select a problem from the 'Problems' tab!")
               )
        )
      )
    ),
    
    # Problems tab
    tabPanel(
      title = "Problems",
      fluidRow(
        column(2, 
               div(class = "sidebar", 
                   h3("Choose a Problem:"),
                   selectInput(
                     inputId = "problem", 
                     label = NULL,  
                     choices = problem_choices,
                     width = "100%" 
                   )
               )
        ),
        column(10, 
               div(class = "main-panel", 
                   uiOutput("markdown") 
               )
        )
      )
    )
  )
)
