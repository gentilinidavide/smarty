library(shiny)
library(shinyAce)
library(psych)
library(car)


shinyServer(function(input, output) {


    bs <- reactive({
            x <- read.csv(text=input$text, sep="\t")
            describe(x)[2:13]
    })
    
    
    correl <- reactive({
            x <- read.csv(text=input$text, sep="\t")
            
            round(cor(cbind(x), use = "complete"),3)
    })
    
    
    
    makecorPlot <- function(){
        x <- read.csv(text=input$text, sep="\t")
        pairs.panels(x)
    }
    
    output$corPlot <- renderPlot({
        print(makecorPlot())
    })
    
    
    
    reg <- reactive({
        dat <- read.csv(text=input$text, sep="\t")
        
        colnames(dat) <- c("Outcome", c(colnames(dat)[2:ncol(dat)]))
        result <- lm(Outcome ~., dat)
        
        reslt <- summary(result)
        print(reslt)
        cnfi <- confint(result)
        
        cat("---", "\n", "95% CI of B (Unstandardized beta):", "\n")
        print(cnfi)
        
        z <- scale(dat)     # standardize the data
        z <- data.frame(z)
        z.res <- summary(lm(Outcome ~ ., z))
        
        stdb <- data.frame(round((z.res$coefficients[,1][-1]),3))
        colnames(stdb)[1] <- "Standardized beta"
        
        cat("\n", "---", "\n", "Standardized beta estimates:", "\n")
        print(stdb)
        
    if (ncol(dat) >= 3) {

        VIF <- vif(result)
        Tolerance <- 1/VIF
        
        vif.res <- round(data.frame(VIF, Tolerance),3)
        
        cat("\n", "---", "\n", "VIF and tolerance statistic (1/VIF):", "\n")
        print(vif.res)
        cat("\n", "VIF should be smaller than 10 (clozer to 1 better);", "\n",
        "tolerance statistic (1/VIF) should be greater than 0.2.", "\n")
    }
    })
    
    
    
    aic <- reactive({
        dat <- read.csv(text=input$text, sep="\t")
        
        colnames(dat) <- c("Outcome", c(colnames(dat)[2:ncol(dat)]))
        result <- lm(Outcome ~., dat)
        
        model <- step(result)
        print(model)
        
        cat("\n", "---", "\n", "Regression analysis with the best fitting model:", "\n")
        
        summary(model)
        
    })
    
    
    info <- reactive({
        info1 <- paste("This analysis was conducted with ", strsplit(R.version$version.string, " \\(")[[1]][1], ".", sep = "")
        info2 <- paste("It was executed on ", date(), ".", sep = "")
        cat(sprintf(info1), "\n")
        cat(sprintf(info2), "\n")
    })
    
    output$info.out <- renderPrint({
        info()
    })



    output$textarea.out <- renderPrint({
        bs()
    })

    output$correl.out <- renderPrint({
        correl()
    })
    
    output$reg.out <- renderPrint({
        reg()
    })
    
    output$aic.out <- renderPrint({
        aic()
    })
 
 #################################

  
    
    
    reg2 <- reactive({
        dat2 <- read.csv(text=input$text2, sep="\t")
        
        colnames(dat2) <- c("Outcome2", c(colnames(dat2)[2:ncol(dat2)]))
        result2 <- glm(Outcome2 ~., dat2,family=binomial)
        
        reslt2 <- summary(result2)
        print(reslt2)
        cnfi2 <- confint(result2)
        
        cat("---", "\n", "95% CI of B (Unstandardized beta):", "\n")
        print(cnfi2)
        
        z2 <- (dat2)     # standardize the data
        z2 <- data.frame(z2)
        z.res2 <- summary(glm(Outcome2 ~ ., z2,family=binomial))
        
        stdb2 <- data.frame(round((z.res2$coefficients[,1][-1]),3))
        colnames(stdb2)[1] <- "Standardized beta"
        
        cat("\n", "---", "\n", "Standardized beta estimates:", "\n")
        print(stdb2)
        
    if (ncol(dat2) >= 3) {

        VIF2 <- vif(result2)
        Tolerance2 <- 1/VIF2
        
        vif.res2 <- round(data.frame(VIF2, Tolerance2),3)
        
        cat("\n", "---", "\n", "VIF and tolerance statistic (1/VIF):", "\n")
        print(vif.res2)
        cat("\n", "VIF should be smaller than 10 (clozer to 1 better);", "\n",
        "tolerance statistic (1/VIF) should be greater than 0.2.", "\n")
    }
    })
    
    
    
    aic2 <- reactive({
        dat2 <- read.csv(text=input$text2, sep="\t")
        
        colnames(dat2) <- c("Outcome2", c(colnames(dat2)[2:ncol(dat2)]))
        result2 <- glm(Outcome2 ~., dat2,family=binomial)
        
        model2 <- step(result2)
        print(model2)
        
        cat("\n", "---", "\n", "Regression analysis with the best fitting model:", "\n")
        
        summary(model2)
        
    })
    
    
    infox <- reactive({
        info2 <- paste("This analysis was conducted with ", strsplit(R.version$version.string, " \\(")[[1]][1], ".", sep = "")
        info3 <- paste("It was executed on ", date(), ".", sep = "")
        cat(sprintf(info2), "\n")
        cat(sprintf(info3), "\n")
    })
    
    output$info.out2 <- renderPrint({
        info()
    })



    output$textarea.out2 <- renderPrint({
        bs()
    })

    output$correl.out2 <- renderPrint({
        correl2()
    })
    
    output$reg.out2 <- renderPrint({
        reg2()
    })
    
    output$aic.out2 <- renderPrint({
        aic2()
    })
	###########################################################################################################

 

})