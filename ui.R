library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel(HTML('<center>US state 1974 per capita income levels explained by your variable of choice</center>')),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h3("Select a variable"),
       selectInput(inputId = "variable", label = "Choose independent variable:",
                   choices = c("Population", "Illiteracy", "Life.Expectancy", "Murder.rate", "High.school.graduates", "Frost", "Area"),
                   selected = "Population")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3("Linear model and graph"),
      p("The following includes the explanation of 1974 US state per capita income levels as per the variable of your choice. 
        Please select a variable on the left-hand side in the dropdown menu to draw a graph including a fitted line in blue, 
        and a summary of the linear model explaining per capita income as per your selection."),
      p("The variables to select from include Population levels as of 1975, illiteracy as of 1970 as a percent of the population, 
        life expectancy in years (1969-71), murder and non-negligent manslaughter rate per 100,000 population (1976), percentage of high-school
        graduates (1970), mean number of days with minimum temperature below freezing in capital or large city (1931-60) and land area in 
        square miles. The dataset used is the R dataset state.x77."),
      p("Your selected variable is :"),
      textOutput("selectedvariable"),
      plotOutput("variableplot"), 
      p("Linear Model Summary: "),
      verbatimTextOutput("modelprediction1")
    )
  )
))
