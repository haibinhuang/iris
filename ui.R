library(shiny)
shinyUI(navbarPage("Navigation Bar",
        tabPanel("Introduction",
          mainPanel(
           h4(textOutput("introduction"))
                   )),
        tabPanel("Iris Classification",
                       sidebarPanel(
              sliderInput("v1", label = h3("Sepal Length"), min = 4.3, max = 7.9, step = 0.1, value = 5.8),
              sliderInput("v2", label = h3("Sepal Width"), min = 2.0, max = 4.4, step = 0.1, value = 3.1),
              sliderInput("v3", label = h3("Petal Length"), min = 1.0, max = 6.9, step = 0.1, value = 3.8),
              sliderInput("v4", label = h3("Petal Width"), min = 0.1, max = 2.5, step = 0.1, value = 1.2)
            ),
                
          mainPanel(
          h4(helpText("The values you selected:")),
          tableOutput("inputedvalue"),
          h4(helpText("Although the iris flower with the specs you selected may not exist on Earth, if it does, 
                      it is mostly likely to be classified as:")),
          h2(textOutput("Predicted_Species"))
                    )

              )
                  )
        )
