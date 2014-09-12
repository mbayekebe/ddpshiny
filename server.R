## server.R
library(shiny)
library(caret)

titanicds <- read.csv("data/titanicdatc.txt", sep=",")

titanicds$Class <- as.factor(titanicds$Class)
titanicds$Age <- as.factor(titanicds$Age)
titanicds$Sex <- as.factor(titanicds$Sex)

inTrain <- createDataPartition(y=titanicds$Survived, p=0.7, list=FALSE)
training <- titanicds[inTrain,]
testing <- titanicds[-inTrain,]

set.seed(125)
modFit <- glm(Survived ~ Class+Age+Sex,data=training,family=binomial(logit))


shinyServer(function(input, output) {


  output$Outcome <- renderText({
  
    switch(input$class,"0"="0","1"="1","2"="2","3"="3")
    switch(input$age,"1"="1","0"="0")
    switch(input$sex,"1"="1","0"="0")
    
    freshdata <- data.frame(Class=input$class,Age=input$age,Sex=input$sex)
    freshPred <- predict(modFit,freshdata,type="response")
    
    if (freshPred > 0.5) {
      Outcome="survived"
    } else {
      Outcome="did not survive"
    }
    paste("Traveler", Outcome)
    
  })
  
  })