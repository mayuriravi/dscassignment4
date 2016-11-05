library(shiny)
mydata <- read.csv("stocksdata.csv")
shinyUI(
  fluidPage(
    navbarPage( "Stock Data App",
    #titlePanel("Top Stock Companies of US"),
    #sidebarLayout(
    #    mainPanel(
    #        tabsetPanel(type = "tabs",
    #               
                    tabPanel("About",br(),
             #    sidebarPanel(
                        helpText(" This application is built using Shiny Application which is available as an addon application with R Studio.
                            The main purpose of this app is to allow users to interactively gain insight about major stocks sold on various stock markets in US. The data for this app is downloaded from Quandl.com. 
                            This application has 2 tabs which present the stock data in Interactive chart and graph."),
                        helpText("Tab 1: Linear Model - 
                            This Interactive plot displays Common Outstanding Shares on the X-axis and 'Operating Income' on Y axis of all stocks listed in the dataset. 
                            Users can select a portion of the data on the graph to see the Linear Model line.
                            The 'Slope' and 'Intercept' values are displayed in the side view panel when the data points are selected on the graph."),
                        helpText("Tab 2: Selective Graph - 
                            This Intractive plot displays 'Company Pre Tax Income' over various quarters for the selected Company and Fiscal Year. 
                            The side panel contains drop downs to select the Stock company and Fiscal year. 
                            Based on the selection respective quarterly Pre Tax Income amounts for the selected Stock is charted as a line graph.")
             #    )
                    ),
    
                    tabPanel("Linear Model", br(),  
                        plotOutput("plot1", brush = brushOpts(id = "brush1")),
                        sidebarPanel( helpText("The Slope and Intercept values displayed below when you select a set of data points on the 
                                               graph."),
                                      h3("Slope"), 
                                      textOutput("slopeOut"),
                                      h3("Intercept"),textOutput("intOut"))
                    ),
                    tabPanel("Selective Graph",br(),
                       sidebarPanel(
                        helpText("Create Stock charts with 
                                 information from the Finance data available for Quandl.com website."),
                        selectInput("compName", 
                                    label = "Choose a Company Name to display",
                                    choices = mydata$comp_name,
                                    selected = "APPLE INC"),
                        selectInput("fiscYear", 
                                    label = "Choose a Fiscal year",
                                    choices = mydata$per_fisc_year,
                                    selected = 2015)
                        
         #                ,sliderInput("Quarter", 
         #                            label = "Range of Quarters:",
         #                           min = 1, max = 4, value = c(1, 4))
         #               ,checkboxInput("showQuarter", "Show/Hide Quarterly Data", value = TRUE),
         #               checkboxInput("showAnnual", "Show/Hide Annual Data", value = TRUE)
                      ),
                      plotOutput("plotChart")
         
                    )
                )
#        )
#    )
   )
)
