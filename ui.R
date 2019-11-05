library(shiny)
suppressWarnings(suppressMessages(library(caret)))
suppressWarnings(suppressMessages(library(randomForest)))
suppressWarnings(suppressMessages(library(e1071)))
suppressWarnings(suppressMessages(library(ggplot2)))
suppressWarnings(suppressMessages(library(corrplot)))
suppressWarnings(suppressMessages(library(rattle)))
suppressWarnings(suppressMessages(library(rpart)))
suppressWarnings(suppressMessages(library(plotly)))
shinyUI(fluidPage(
  titlePanel("Predict the fower class from the length and width of the petal using a decision tree model"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderPetalLength", "What is the length of the petal?", 0, 10, value = 0,step=0.1),
      sliderInput("sliderPetalWidth", "What is the width of the petal?", 0, 4, value = 0,step=0.1),
      submitButton("Submit")
    ),
    mainPanel(
      tabsetPanel(type = "tabs", 
         tabPanel("Prediction", br(), plotOutput("plot1"),
      h3("Predicted Flower from the Decision Tree model:"),
      textOutput("pred1")),
      tabPanel("Tree Representation", br(), h3("Decision Tree model:"), plotOutput("plot2"))
      )
    )
  )
))