
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Assign Type to a New Client"),

  sidebarPanel("Instructions: Ask your new client the questions below. Based on the responses, select values from 1 (not important) to 5 (very important) for each attribute. Click <Submit> when finished",h1(""),
       
             sliderInput("slider1", label = "Q1: It's important to me how I'm perceived in the community",
                         min = 1, max = 5, value = 3),
             sliderInput("slider2", label="Q2: I'm always trying to understand my customers' needs",
                         min = 1, max = 5, value = 3),
             sliderInput("slider3", label="Q3: Making sure that the store is always properly stocked is important",
                         min = 1, max = 5, value = 3), 
             sliderInput("slider4", label="Q4: Getting a deal from a supplier is how they get my business",
                         min = 1, max = 5, value = 3), 
             sliderInput("slider5", label="Q5: I'm always looking for ways to attract new customers",
                         min = 1, max = 5, value = 3), 
      actionButton("Submit","Submit")
  ),
  mainPanel(
      #p("Output slider1"),
      #textOutput("text1"),
      #p("Output slider2"),
      #textOutput("text2"),
      #p("Output slider3"),
      #textOutput("text3"),
      #p("Output slider4"),
      #textOutput("text4"),
      #p("Output slider5"),
     
      
      
      p(h3("Your new client is:")), 
      h4(textOutput("text6"))
      
  )
)
)
