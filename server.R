library(shiny)
library(caret)
library(gbm)
load("model.rda")

shinyServer(function(input, output, session) {
      slidervalue <- reactive({
        data.frame("Sepal.Length"=input$v1, "Sepal.Width"=input$v2, "Petal.Length"=input$v3, "Petal.Width"=input$v4)})
      fit <- function(v1, v2, v3, v4) {
                as.character(predict(model, newdata=data.frame("Sepal.Length"=v1, "Sepal.Width"=v2, "Petal.Length"=v3, "Petal.Width"=v4)))
              }    
      output$introduction <- renderText({"This shiny app is designed to predict iris flower species
based on user input of 4 parameters: sepal length, sepal width, petal length and petal width. 
The iris data set from famous (Fisher's or Anderson's) used to build this model gives the 
measurements in centimeters of the variables sepal length and width and petal length and width, 
respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, 
versicolor, and virginica. To run the app, navigate to the \"Iris Classification\" tab, 
use the slider bar at the left panel to choose the desired value of 4 parameters, 
and you will find out the value you selected at the upper right table and the predicted species 
name at the center based on your inputs. Please note, simply change one value, or change values slightly, 
may not change the classification, this is not a malfunction of the program, try to change more 
than one parameter and/or more dramatically to see the predicted species change.
"})
      output$inputedvalue <- renderTable({slidervalue()})
      output$Predicted_Species <- renderText({fit(input$v1, input$v2, input$v3, input$v4)})
      
  })
