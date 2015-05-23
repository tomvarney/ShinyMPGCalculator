
# https://tvarney.shinyapps.io/MPG_Calculator/
data(mtcars)

fit <- lm(mpg~wt,data=mtcars)

shinyServer(
  function(input, output) {
    output$newPlot <- renderPlot({
      wt <- input$wt
      conf <- as.numeric(input$conf)
      num_sd <- qnorm(1-(1-conf/100) / 2)
      m=summary(fit)$coeff[1,1] + (summary(fit)$coeff[2,1] ) * wt/1000
      sd =  summary(fit)$coeff[2,2]
      interval <- num_sd * sd
      library(ggplot2)

      f <- ggplot(data.frame(x = c(m - 2.7 * sd, m + 2.7 * sd)), aes(x))
      f <- f + stat_function(fun = dnorm, args = list(mean = m, sd = sd), colour = "red")
      f <- f  + xlab("Expected MPG") +
        ggtitle("Distribution of Predicted MPG based on Weight of Your Car")
      f <- f+ geom_vline(xintercept=m,
                         linetype=1,
                         color="black",
                         labels="Estimate MPG",
                         show_guide=TRUE)
      f <- f+ geom_vline(xintercept=m + interval,
                         linetype=2,
                         color="blue",
                         labels="Estimate MPG",
                         show_guide=TRUE)
      f <- f+ geom_vline(xintercept=m - interval,
                         linetype=2,
                         color="blue",
                         labels="Estimate MPG"
                         #,show_guide=TRUE
      )
      f <- f + geom_text(x=m-sd*1.5, y=.56, label=paste("Weight = ", wt))
      f <- f + geom_text(x=m-sd*1.5, y=.52, label= paste("Estimated MPG = ", round(m, 2)))
      f <- f + geom_text(x=m-sd*1.5, y=.48, label=paste("Conf = ", conf, " %"))      
      print(f)

    })
  }
)