library(shiny)
library(ggplot2)
library(dplyr)
# select columns to be used in the analysis
# Define server logic required to draw a plot
shinyServer(function(input, output) {
        output$Visualization <- renderPlot({
                ggplot(diamonds,aes(carat,price))+geom_point(aes(color=cut,size=color),alpha=0.3) + facet_grid(~clarity)
        })
        output$result <- renderText({
                # renders the text for the prediction below the graph
                fit <- lm( price~carat + cut + color + clarity, diamonds)
                pred <- predict(fit, newdata = data.frame(carat = input$carat,
                                                          cut = input$cut,
                                                          color = input$color,
                                                          clarity = input$clarity))
                res <- paste(round(pred, digits = 2), "$")
                res
        })
        
})