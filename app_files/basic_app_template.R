
# This is the absolute bare minimum of what I need to create a shiny app.
# Beware! ... This alone will be a REALLY boring app. A blank page :(

library(shiny)
library(tidyverse)
library(babynames)

ui <- fluidPage(textInput(inputId = "name", 
                          label = "Name:",
                          value = "",
                          placeholder = "Enter name here"),
                sliderInput("years",
                            "Years:",
                            min = 1880,
                            max = 2017,
                            value = c(1880,2017),
                            sep = ""),
                selectInput("sex",
                            "Sex:",
                            c("Male" = "M","Female" = "F")),
                plotOutput(outputId = "timeplot"))
server <- function(input, output) {
  output$timeplot <- renderPlot(
    babynames %>%
      filter(sex == input$sex,
             name == input$name) %>%
      ggplot(aes(x = year, y = n)) + 
      geom_line() + 
      scale_x_continuous(limits = )
  )
}
shinyApp(ui = ui, server = server)