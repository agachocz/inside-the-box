library(shiny)
library(ggplot2)

shinyApp(
  
  ui = fluidPage(
    sliderInput("n", label = "Wielkość próby",
                min = 2, max = 100, value = 30),
    sliderInput("sd", label = "Odchylenie standardowe błędu",
                min = 0.01, max = 1, value = 0.3),
    plotOutput("plot")
  ),
  
  server = function(input, output) {
    
    output$plot = renderPlot({
      
      x <- runif(100)
      eps <- rnorm(100, 0, input$sd)
      y <- 3.67*x + 0.82 + eps
      probe <- sample(100, input$n, replace=F)
      data <- data.frame(x = x[probe], y = y[probe])
      model <- lm(y~x, data)
      coeff <- model$coefficients
      subtitle <- paste0("Równanie wynikowe: y = ", round(coeff[2],2), 
                         "x + ", round(coeff[1], 2))
      
      ggplot(data, aes(x = x, y = y)) + geom_point() +
        geom_smooth(method = lm, se = T) +
        labs(title = "Równanie oryginalne: y = 3.67x + 0.82",
             subtitle = subtitle)
    })
  }
)