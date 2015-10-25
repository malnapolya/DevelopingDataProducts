library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Statistics from the 'mtcars' dataset"),
        sidebarPanel(
                selectInput("variable","Choose the variable:",
                            choices=c("MPG","Number of Cylinders","Horse Power", "Weight",
                                      "Gear")),
                radioButtons("stat","Choose the type of statistics:",
                             choices=c("Mean","Median","Max","Min"))
        ),
        mainPanel(
                h3('Output of the calculations'),
                h4("The required variable:"),
                verbatimTextOutput("variable"),
                h4("The required statistics:"),
                verbatimTextOutput("stat"),
                h4("The result of the calculation"),
                verbatimTextOutput("result"),
                tabsetPanel(
                        tabPanel("How to use?",
                                 h3("How to use this App?"),
                                 p("This App uses the subset of the 'mtcars' dataset (see 'Original data' tab)
                                   and performs some basic statistics on the individual variables."),
                                 p("Please select the variable you are interested in learning some basic statistics about
                                   by choosing the variable from the drop-down on the left under 'Choose a variable'. The variable names are self-explanatory."),
                                 p("Afterwards, please select the type of statistics you want to learn about the selected variable with the help of the radio 
                                buttons on the left under 'Choose the type of statistics'.
                                   You can select mean, median, max or min. The program will run the calculations accordingly."),
                                 p("The results will show on the right main pain, under the 'The result of the calculation', in a text box."),
                                 p("If you want to learn more about the dataset that is used, consult the 'Original data' tab or google 'mtcars dataset in R'.")),
                        tabPanel("Original data",
                                 h3("The 'mtcars' dataset that the calculations are run on"),
                                 tableOutput("view"))
                )
        )
))