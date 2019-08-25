#SERVER SIDE LOGIC
library(shiny)

# Define server logic required to evaluate input and plot
shinyServer(function(input, output) {
  
  #CREAT SIMPLE COUNTERs AND INITIAL DEFINES
  num1 <- reactiveValues(num1 = sample(1:10,1))
  num2 <- reactiveValues(num2 = sample(1:10,1))
  
  counter <- reactiveValues(countervalue = 0) # Defining & initializing the reactiveValues object
  counterArray <- reactiveValues(index = 0)
  corrAnswCounter <- reactiveValues(countervalue = 0) # Defining & initializing the reactiveValues object
  calc <- reactiveValues(acc = 0)
  calcArray <- reactiveValues(acc = 0)
  output$num3<-renderText("")
  
  #######OBSERVE EVENT ##########
  observeEvent(input$calcAcc, {
    counter$countervalue <- (counter$countervalue + 1)     # if the add button is clicked, increment the value by 1 and update it
    #PUT THIS IN ARRAY SO ACCURACY CAN PLOT
    if (input$num3 == num2$num2*num1$num1) {
      corrAnswCounter$countervalue<-(corrAnswCounter$countervalue + 1) 
      output$num3<-renderText({"YOU ARE CORRECT"})
    }
    else {output$num3<-renderText("WRONG! TRY AGAIN")}
    
    calc$acc <- (corrAnswCounter$countervalue/counter$countervalue)*100
    counterArray$index[counter$countervalue] <- counter$countervalue 
    calcArray$acc[counter$countervalue] <- calc$acc
    
    num1$num1 <- sample(1:10,1)
    num2$num2 <- sample(1:10,1)
    
  })
  
 output$counter <-renderText({paste("ATTEMPT #",(counter$countervalue+1))})
 output$accuracy<-renderText({paste("YOUR CURRENT ACCURACY IS",calc$acc, "%")})
 output$value <- renderText({paste0("What is the product of ", num1$num1, " and ", num2$num2, "?")})
 output$plot <-renderPlot({
   x = counterArray$index 
   y = calcArray$acc 
   plot(x,y, main= "MATH ACCURACY", xlab="# ATTEMPT", ylab="ACCURACY IN %", ylim=c(0,100))
   })
  
  

})
  

