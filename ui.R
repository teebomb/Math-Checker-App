#USER SIDE LOGIC
library(shiny)

# Define UI for application that evaluates user input and plots
shinyUI(fluidPage(
  
  # Application title
  #titlePanel("Learn your Multiplication"), #MOVED THIS TO BODY
  titlePanel(""), #ADDS A NCIE SPACE
  
   
  ###sidebarLayout
    sidebarPanel(
      actionLink("Help", label="Help", onclick="window.open('https://htmlpreview.github.io/?https://github.com/teebomb/Math-Checker-App/blob/master/HELP_FILE.html')")
    ),
    
  titlePanel("Learn your Multiplication"),
    # Show a plot of the user-generated distribution
    mainPanel(
       h3("Multiplication Challenge"),
       h3(textOutput("counter")),
       textOutput("value"),
       
       numericInput("num3", "Your Guess", min=1, max=1000, value=0),
       actionButton("calcAcc", "Submit"),
      
       
       h3(textOutput("num3")), 
       h3(textOutput("accuracy")),
       plotOutput("plot")
    )
  )
)

