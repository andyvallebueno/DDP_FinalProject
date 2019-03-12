#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
# use: options(rsconnect.http = "rcurl") 

library(shiny)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  data <- state.x77
  data <- as.data.frame(data)
  names(data)<- c("Population", "Income", "Illiteracy", "Life.Expectancy", "Murder.rate", "High.school.graduates", "Frost", "Area")
  data<- tbl_df(data)
  

  
  selectedvariable <- reactive({
    input$variable
  })
  
  output$selectedvariable <- renderText({
    selectedvariable()
  })
  
  subdata <- reactive({
    subdata<- select(data, Income, input$variable)
  })
  
  ## Linear model
  
  modelprediction<- reactive({
    tofit <- subdata()
    lm(Income ~ ., data = tofit)
  })
  
  ## Plot
    
  output$variableplot <- renderPlot({
    toplot<- subdata()  
    plot(toplot[, 2:1])
    abline(modelprediction(), col = "blue")
    })
    
  ## Problem
  modelpredictionsummary<- reactive({
    tofit <- subdata()
    fit<- lm(Income ~ ., data = tofit)
    summary(fit)
  })
  
   output$modelprediction1 <- renderPrint({
     modelpredictionsummary()
   })
  
})
