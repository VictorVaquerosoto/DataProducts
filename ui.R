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
  titlePanel("Predict the flower class from the length and width of the petal using a decision tree model"),
  sidebarLayout(
    sidebarPanel(
      ("This application works with the iris dataset. 
      This data set contains 3 classes of 50 instances each, where each class refers to a type of iris plant.
       The idea of this app is to classify the type of flower based on the length and width of its petal.
       For that, please, select a Length and width petal and see the result."),
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