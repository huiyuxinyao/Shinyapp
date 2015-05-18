library(shiny)
require(markdown)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Prediction on Miles Per Gallon"),
  
  # Sidebar
  sidebarLayout(
    sidebarPanel(h3("Please input your car information below"),
      sliderInput("qsec",
                  "1/4 mile time(in seconds):",
                  min = 10,
                  max = 20,
                  value = 15)
    ,
    checkboxInput("am", 'Check if manual transmission', value = FALSE),
    numericInput('wt', 
                 'Car Weight (1000lbs)', 
              value=3.5),
    submitButton('submit')),
  
    mainPanel(tabsetPanel(
              tabPanel("Prediction result",
              h4('You entered'),
              verbatimTextOutput("inputValue1"),
              verbatimTextOutput("inputValue2"),
              verbatimTextOutput("inputValue3"),
              h4('Which resulted in a prediction of below miles per gallon'),
              verbatimTextOutput("prediction"))
              
    ,
    tabPanel("Help",
             mainPanel(includeMarkdown("Help.md"))))
  )
)))
