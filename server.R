library(shiny)
data(mtcars)
fit<-lm(mpg~wt+am+qsec,mtcars)

mpgprediction<-function(wt,am,qsec){
  a<-c(wt,am,qsec)
  dim(a)<-c(1,3)
  a<-data.frame(a)
  names(a)<-c("wt","am","qsec")
  predict(fit,newdata=a)
}

shinyServer(
  function(input,output){
  output$inputValue1<-renderPrint({input$qsec})
  output$inputValue2<-renderPrint({input$am})
  output$inputValue3<-renderPrint({input$wt})
  output$prediction<-renderPrint({mpgprediction(input$wt,input$am,input$qsec)})
})
