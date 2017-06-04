library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        titlePanel("Diamond price"),
        
        # Sidebar with options selectors 
        sidebarLayout(
                sidebarPanel(
                        numericInput("carat", "Carats", step = 0.01, value = 2),
                        selectInput("cut", "Cut", 
                                    choices = list("Fair" = "Fair", "Good" = "^Good",
                                                   "Very Good" = "Very Good", "Premium" = "Premium",
                                                   "Ideal" = "Ideal")),
                        selectInput("color","Color", 
                                    choices = list("D" = "D", "E" = "E",
                                                   "F" = "F", "G" ="G",
                                                   "H" = "H", "I" = "I",
                                                   "J" = "J")),
                        selectInput("clarity", "Clarity", 
                                    choices = list("I1" = "I1", "SI2" = "SI2",
                                                   "SI1" = "SI1", "VS2" = "VS2", "VS1" = "VS1",
                                                   "VVS2" = "VVS2", "VVS1" = "VVS1", "IF" = "IF", "Unknown" = "*"))
                ),
                
                # Show a plot with diamonds and regression line
                mainPanel(
                        plotOutput('Visualization'),
                        h4("Predicted value of this diamond is:"),
                        h3(textOutput("result"))
                )
        )
))