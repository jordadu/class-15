library(shiny)
library(tidyverse)

ui <- fluidPage(
    numericInput(inputId = "numero_observaciones", "Sample size", value = 200), 
                 plotOutput(outputId = "histograma")
)


server <- function(input, output, session) {
    output$histograma <- renderPlot({
      
        p = tibble(data=rnorm(n = input$numero_observaciones , mean = 100 , sd = 50))
          
        ggplot() + geom_histogram(data = p , aes(x=data) , fill = "red") +
        labs(title = "Histograma de N observaciones" , x = "Variable" , y = "Frecuencia") +
        theme_bw()
        })
}

# Run the application 
shinyApp(ui = ui, server = server)
