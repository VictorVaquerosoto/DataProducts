library(shiny)
suppressWarnings(suppressMessages(library(caret)))
suppressWarnings(suppressMessages(library(randomForest)))
suppressWarnings(suppressMessages(library(e1071)))
suppressWarnings(suppressMessages(library(ggplot2)))
suppressWarnings(suppressMessages(library(corrplot)))
suppressWarnings(suppressMessages(library(rattle)))
suppressWarnings(suppressMessages(library(rpart)))
suppressWarnings(suppressMessages(library(plotly)))
shinyServer(function(input, output) {
  
  set.seed(123)
  modFit1<-rpart(Species~Petal.Length+Petal.Width,data=iris, method = "class")
  
  modelpred <- reactive({
    petallengthInput <- input$sliderPetalLength
    petalwidthInput <- input$sliderPetalWidth
    predict(modFit1,newdata=data.frame(Petal.Length=petallengthInput,Petal.Width=petalwidthInput),type="class")
    
  })
  output$plot1 <- renderPlot({
    petallengthInput <- input$sliderPetalLength
    petalwidthInput <- input$sliderPetalWidth
    scatter <- ggplot(data=iris, aes(x = Petal.Length, y = Petal.Width)) 
    scatter + geom_point(aes(color=Species)) +
      xlim(0, 10)+ylim(0,4)+ggtitle("Iris dataset")+
      xlab("Petal Length") +  ylab("Petal Width")+
      geom_point(aes(x=petallengthInput, y=petalwidthInput), colour=(as.integer(modelpred())+1), size=4) +
      geom_text(aes(x=petallengthInput+1.05, y=petalwidthInput, label = "Your point")) 
  })
  
  output$plot2 <- renderPlot({
    fancyRpartPlot(modFit1)
  }) 
  
  output$pred1 <- renderText({
    
    if(as.integer(modelpred())==1){
      "Flower Setosa"}
    else if ( as.integer(modelpred())==2) {
      "Flower Versicolor"
    }  else {
      "Flower Virginica"
    }
  })
  
 
  
  
})