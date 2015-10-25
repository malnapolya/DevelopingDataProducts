library(shiny)
library(datasets)
data(mtcars)

shinyServer(
        function(input, output) {
              output$stat<-renderPrint({input$stat})  
              output$variable<-renderPrint(({input$variable}))
              output$view<-renderTable({mtcars[,c('mpg','cyl','hp','wt','gear')]})
              var<-reactive({
                      switch (input$variable,
                              'MPG' = 'mpg',
                              'Number of Cylinders' = 'cyl',
                              'Horse Power' = 'hp',
                              'Weight' = 'wt',
                              'Gear' = 'gear')
              })
              datasetInput<-reactive({
                      mtcars[,var()]
              })
              calculation<-reactive({
                      switch (input$stat,
                              'Mean' = mean(datasetInput()),
                              'Median' = median(datasetInput()),
                              'Min' = min(datasetInput()),
                              'Max' = max(datasetInput())
                      )
              })
              output$result<-renderPrint({
                      calculation()
                      
              })
        }
)