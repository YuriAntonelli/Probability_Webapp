library(shiny)
library(shinythemes)

# Define the path to the problems directory
problems_path <- "problems_repository/html_files/"

# Dynamically get the list of HTML files from the directory
problem_files <- list.files(problems_path, pattern = "\\.html$", full.names = FALSE)

# Remove the ".html" extension and format problem names for the dropdown
problem_names <- gsub("\\.html$", "", problem_files)
problem_choices <- setNames(paste0(problems_path, problem_files), gsub("_", " ", problem_names))

# Define UI
ui <- fluidPage(
  theme = shinytheme("flatly"),
  navbarPage(
    title = div(icon("calculator"), "Probability App"),
    
    # Home page tab
    tabPanel(
      title = "Home",
      fluidRow(
        column(12,
               div(class = "main-panel", 
                   h2("Welcome to the Probability Problems App!"),
                   p("This app showcases some of the most famous probability puzzles in history. Each puzzle is presented with an explanation and some thought-provoking scenarios."),
                   p("Explore these puzzles to understand the fascinating world of probability and how these problems can defy common intuition."),
                   p("To get started, select a problem from the 'Problems' tab. We hope you enjoy solving these interesting challenges!")
               )
        )
      )
    ),
    
    # Problems tab
    tabPanel(
      title = "Problems",
      fluidRow(
        column(3, 
               div(class = "sidebar", 
                   h3("Choose a Problem:"),
                   selectInput(
                     inputId = "problem", 
                     label = NULL,  # Removed redundant label, as h3 covers it
                     choices = problem_choices,
                     width = "100%"  # Full width dropdown
                   )
               )
        ),
        column(9, 
               div(class = "main-panel", 
                   uiOutput("markdown")
               )
        )
      )
    )
  )
)