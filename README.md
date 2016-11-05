# Data Science Course Assignment 4

This application is built using Shiny Application which is available as an addon application with R Studio.
The main purpose of this app is to allow users to interactively gain insight about major stocks sold on various stock markets in US.
The data for this app is downloaded from Quandl.com. 
This application has 3 tabs which present the stock data in Interactive charts.

##Tab 1: About
Contains details about the Application

##Tab 2: Linear Model
This Interactive plot displays Common Outstanding Shares on the X-axis and "Operating Income" on Y axis of all stocks listed in the dataset. Users can select a portion of the data on the graph to see the Linear Model line.

The 'Slope' and 'Intercept' values are displayed in the side view panel when the data points are selected on the graph.

##Tab 3: Selective Graph
This Intractive plot displays Company Pre Tax Income over various quarters for the selected Company and Fiscal Year.
The side panel contains a drop downs to select the Stock company and Fiscal year.
Based on the selection respective quarterly Pre Tax Income amounts for the selected Stock is charted as a line graph.
