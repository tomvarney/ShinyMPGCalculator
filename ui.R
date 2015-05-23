
shinyUI(pageWithSidebar(
  headerPanel("MPG Calculator"),
  sidebarPanel(
  
    tags$small(paste0(
      "Instructions:  ",
      "The MPG Calculator will estimate the MPG of your car based on ",
      "the weight of your car.  it will give you an expected MPG value ",
      "and will provide a plot indicating the confidence interval for ",
      " the estimate.  The confidence estimate is based on the user's",
      "selection below.",
      " To use the MPG calculator, please use the slider to enter the ",
      "wieght of hte car, and then use the dropdown box to choose a ",
      "confidence level of 90%, 95% or 99%.",
      ""
    )),
    

    
    sliderInput('wt', 'Enter the Weight of Your Car',value = 3000, min = 0, max = 10000, step = 500,),
    
    selectInput(inputId = "conf",
                label = "Choose Confidence Level:",
                choices = c(90, 95, 99),
                selected = 95)

  ),
  mainPanel(
    plotOutput('newPlot')
  )
))
