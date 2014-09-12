## ui.R
library(shiny)

shinyUI(fluidPage(theme = "bootstrap.css",
  
  #titlePanel("Survival On The Titanic"),
  tags$div(style="background-color:#669999", align="center", tags$p(h2("Exploring Survival On The Titanic"),br())),
  
  fluidRow(
    
    column(3,
           
           h3("Documentation"),
           
           helpText("This application fits a logit model;",
           "the Titanic data set is used for that purpose;",
           "a prediction is made whether a given traveler",
           "with a given profile is classified as having",
           "survived or not the sinking of the ship; to use the",
           "app, select the traveler's attributes by clicking each of the",
           "select boxes under Control Center, and get the ",
           "predicted outcome on the right by clicking on the Submit button.",
           "Note: the app will give you default initial attributes and",
           "default initial prediction.")
    ),
    
    column(3,
           
      h3("Control Center"),
      
      selectInput("class", "Down arrow for traveler class:", choices = list("Crew"= 0,"First Class" = 1,"Second Class" = 2,"Third Class" = 3) ),
      br(),
      selectInput("age","Down arrow for traveler age group:", choices = list("Adult" = 1,"Child" = 0) ),
      br(),
      selectInput("sex","Down arrow for traveler gender:", choices = list("Male" = 1,"Female" = 0)),
      br(),
      submitButton("Submit")),
    
    column(3,
           
           h3("Outcome"),
           br(),
           h4("The prediction is"),
           verbatimTextOutput("Outcome"))
    
    ),
      
  fluidRow(
    
    tags$div(style="", align="center",
             tags$p(h3("Titanic Scene Rendering")),
             tags$p("The shows the values of four categorical variables",
                    "for each of the 2201 people on board the Titanic",
                    "when it struck an iceberg and sank.",
                    "The attributes are class (first class, second class, third class, crewmember),",
                    "age (adult or child), sex, and whether or not the person survived.",
                    "The main interest for this application is how survival relates to the other attributes.",
                    "There is of course no practical need to predict survival,the real interest being interpretation"),
             img(src='titanic.jpg', height = 174, width = 300))
    
  ),
  
  br(),
  fluidRow(
    
    tags$div(style="background-color:#669999", align="center",
             tags$p(h5("Gnu licensing")))
    
  )
  
))