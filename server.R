library(shiny)
library(plotly)
mydata <- read.csv("stocksdata.csv")
shinyServer(function(input, output) {
    model <- reactive({
        brushed_data <- brushedPoints(mydata, input$brush1,
                                      xvar = "comm_shares_out", yvar = "oper_income")
        if(nrow(brushed_data) < 2){
            return(NULL)
        }
        lm(oper_income ~ comm_shares_out, data = brushed_data)
    })
    
    output$slopeOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[1]][2]
        }
    })
    
    output$intOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[1]][1]
        }
    })
    
    output$plot1 <- renderPlot({
        plot(mydata$comm_shares_out, mydata$oper_income, xlab = "Common Outstanding Shares(Thousands)",
             ylab = "Operating Income", main = "Company PErformance(Thousands)",
             cex = 1.5, pch = 16, bty = "n", col = "dark red")
        if(!is.null(model())){
            abline(model(), col = "blue", lwd = 2)
        }
    })
  
    dataOut <- reactive({
        validate(
            need(input$compName!= "", "Please Select a Company Name"),
            need(input$fiscYear!="", "Please Select a Fiscal Year")
        )
        if(is.null(input$compName)){
            input$compName <- c("APPLE INC")
        }
        
        if(is.null(input$fiscYear)){
            input$fiscYear <- 2015
        }
    })  
    output$plotChart <- renderPlot({
        test <- dataOut()
        if(length(input$compName) > 0) {
            subdata <- mydata[mydata$comp_name == input$compName & mydata$per_fisc_year == input$fiscYear & mydata$per_type == "Q",]
            if(nrow(subdata) > 0) {
                plot(x = subdata$per_fisc_qtr, y = subdata$pre_tax_income, type="l", xlab = "Quarters",
                    ylab = "Pre Tax Income(Thousands)", main = "Company Pre Tax Income over various quarters for the selected year",
                    cex = 1.5, pch = 16, col = "dark red")
            }
        }

        #plot(mydata$income_aft_tax[seq_len(input$Quarter)&& ], breaks = 100)
    })

})