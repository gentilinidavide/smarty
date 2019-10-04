library(shiny)
library(shinyAce)


shinyUI(bootstrapPage(

   headerPanel("Regression Analysis"),

   mainPanel(
        tabsetPanel(

        tabPanel("Multiple Linear Regression",
		
						 p(HTML("<b><div style='background-color:#fcfcf9;border:0.9px solid black;'>Multiple linear regression is the most common form of linear regression analysis.  As a predictive analysis, the multiple linear regression is used to explain the relationship between one continuous dependent variable and two or more independent variables.  The independent variables can be continuous or categorical (dummy coded as appropriate).</b></div>")),

			 p(HTML("<b><div style='background-color:#f9f62a;border:0.9px solid black;'>To input your data Copy and paste from Excel/Numbers .</b></div>")),

        p(HTML("<b><div style='background-color:#FADDF2;border:0.9px solid black;'>Please make sure that your data includes the header (variable names) in the first row.<br>
                The outcome (dependent) variable should be placed in the first column.</b></div>")),
				

            aceEditor("text", value="Y\tX1\tX2\tX3\n11\t282\t2990\t41\n9\t267\t3325\t26\n12\t284\t3635\t45\n14\t273\t2920\t33\n7\t268\t2950\t43\n20\t279\t3845\t43\n8\t266\t3865\t37\n10\t286\t3400\t37\nNA\t276\t3950\t36\nNA\t270\t3050\t42\n10\t283\t2735\t35\n12\t265\t3230\t39\n17\t280\t2770\t40\n5\t268\t2720\t31\n18\t280\t3820\t39\n17\t283\t3050\t37\n15\t261\t3835\t30\n8\t278\t3815\t34\nNA\t258\t1600\t36\n15\t270\t3030\t37\n28\t262\t4135\t34\nNA\t280\t3000\t34\n17\t264\t3220\t33\n18\t266\t3420\t38\n13\t289\t3300\t30\n16\t288\t3380\t42\n14\t290\t3525\t38\n11\t282\t3660\t35\n12\t279\t3010\t29\n18\t271\t3835\t40\n9\t268\t2870\t43\nNA\t266\t2895\t31\n15\t281\t2815\t38\n12\t266\t2965\t31\n9\t279\t3590\t29\n11\t264\t2910\t38\n12\t258\t2615\t35\n25\t269\t3670\t30\n20\t289\t3835\t32\n7\t270\t3070\t31\n12\t274\t2875\t34\nNA\t275\t3070\t30\n12\t264\t2845\t40\n11\t270\t3070\t39\n10\t277\t2920\t34\nNA\t265\t2950\t35\n17\t279\t3910\t41\nNA\t288\t3610\t30\n12\t277\t3665\t31\n7\t268\t3015\t35\n12\t281\t3250\t34\n18\t278\t2960\t24\n12\t281\t4050\t34\n18\t281\t4190\t25\n3\t275\t3300\t44\n16\t274\t3190\t36\n13\t274\t2860\t40\n14\t226\t1970\t33\n11\t247\t2080\t39\n19\t258\t2980\t36\n8\t251\t2240\t42\n13\t254\t2620\t35\n15\t251\t2250\t36\n7\t219\t1680\t23\n6\t253\t2910\t31\n10\t284\t4060\t33\n13\t283\t3000\t34\n-2\t282\t3550\t25\n10\t185\t900\t21\n8\t285\t3250\t33\n13\t289\t3380\t33\n10\t274\t2990\t24\n15\t287\t3140\t31\n13\t254\t2770\t37\n12\t278\t3700\t26\n9\t224\t2110\t19\n6\t250\t2650\t37\n9\t283\t3570\t35\n7\t236\t2280\t34\n7\t270\t3760\t28\n12\t251\t2970\t38\n10\t264\t2830\t42\n12\t280\t2730\t36\n13\t253\t2370\t31\n12\t286\t3260\t39\n2\t251\t2430\t30\n13\t284\t3835\t32\n12\t256\t2480\t37\n15\t258\t2900\t40\n10\t274\t3000\t35",
                mode="r", theme="terminal"),

            br(),

            h3("Basic statistics"),
            verbatimTextOutput("textarea.out"),

            br(),

            h3("Correlation"),

            verbatimTextOutput("correl.out"),

            br(),

            strong("Scatter plot matrices"),
            br(),

            plotOutput("corPlot"),

            br(),

            h3("Regression analysis"),
            verbatimTextOutput("reg.out"),

            br(),

            h3("Choose a model by AIC in a Stepwise Algorithm"),
            verbatimTextOutput("aic.out"),

            br(),
            br(),

            strong('R session info'),
            verbatimTextOutput("info.out")


            ),
#######################################################

tabPanel("Multiple Logistic Regression",
		
						 p(HTML("<b><div style='background-color:#fcfcf9;border:0.9px solid black;'>Use multiple logistic regression when you have one nominal and two or more measurement variables. The nominal variable is the dependent (Y) variable; you are studying the effect that the independent (X) variables have on the probability of obtaining a particular value of the dependent variable. For example, you might want to know the effect that blood pressure, age, and weight have on the probability that a person will have a heart attack in the next year. </b></div>")),

			 p(HTML("<b><div style='background-color:#f9f62a;border:0.9px solid black;'>To input your data Copy and paste from Excel/Numbers .</b></div>")),

        p(HTML("<b><div style='background-color:#FADDF2;border:0.9px solid black;'>Please make sure that your data includes the header (variable names) in the first row.<br>
                The outcome (dependent) variable must bi binomial and indicated as 0 1 and placed in the first column.</b></div>")),
				
            aceEditor("text2", value="Y\tX1\tX2\tX3\n0\t282\t2990\t41\n0\t267\t3325\t26\n0\t284\t3635\t45\n0\t273\t2920\t33\n0\t268\t2950\t43\n0\t279\t3845\t43\n0\t266\t3865\t37\n0\t286\t3400\t37\n0\t276\t3950\t36\n0\t270\t3050\t42\n0\t283\t2735\t35\n0\t265\t3230\t39\n0\t280\t2770\t40\n0\t268\t2720\t31\n0\t280\t3820\t39\n0\t283\t3050\t37\n0\t261\t3835\t30\n0\t278\t3815\t34\n0\t258\t1600\t36\n0\t270\t3030\t37\n0\t262\t4135\t34\n0\t280\t3000\t34\n0\t264\t3220\t33\n0\t266\t3420\t38\n0\t289\t3300\t30\n0\t288\t3380\t42\n0\t290\t3525\t38\n0\t282\t3660\t35\n0\t279\t3010\t29\n0\t271\t3835\t40\n0\t268\t2870\t43\n0\t266\t2895\t31\n0\t281\t2815\t38\n0\t266\t2965\t31\n0\t279\t3590\t29\n0\t264\t2910\t38\n0\t258\t2615\t35\n0\t269\t3670\t30\n0\t289\t3835\t32\n0\t270\t3070\t31\n0\t274\t2875\t34\n0\t275\t3070\t30\n0\t264\t2845\t40\n0\t270\t3070\t39\n0\t277\t2920\t34\n0\t265\t2950\t35\n0\t279\t3910\t41\n0\t288\t3610\t30\n0\t277\t3665\t31\n0\t268\t3015\t35\n0\t281\t3250\t34\n0\t278\t2960\t24\n0\t281\t4050\t34\n0\t281\t4190\t25\n0\t275\t3300\t44\n0\t274\t3190\t36\n0\t274\t2860\t40\n1\t226\t1970\t33\n1\t247\t2080\t39\n1\t258\t2980\t36\n1\t251\t2240\t42\n1\t254\t2620\t35\n1\t251\t2250\t36\n1\t219\t1680\t23\n1\t253\t2910\t31\n0\t284\t4060\t33\n0\t283\t3000\t34\n0\t282\t3550\t25\n1\t185\t900\t21\n0\t285\t3250\t33\n0\t289\t3380\t33\n0\t274\t2990\t24\n0\t287\t3140\t31\n1\t254\t2770\t37\n0\t278\t3700\t26\n1\t224\t2110\t19\n1\t250\t2650\t37\n0\t283\t3570\t35\n1\t236\t2280\t34\n0\t270\t3760\t28\n1\t251\t2970\t38\n0\t264\t2830\t42\n0\t280\t2730\t36\n1\t253\t2370\t31\n0\t286\t3260\t39\n1\t251\t2430\t30\n0\t284\t3835\t32\n1\t256\t2480\t37\n1\t258\t2900\t40\n0\t274\t3000\t35",
                mode="r", theme="terminal"),

            br(),

            h3("Basic statistics"),
            verbatimTextOutput("textarea.out2"),

            br(),

            h3("Logistic Regression analysis"),
            verbatimTextOutput("reg.out2"),

            br(),

            h3("Choose a model by AIC in a Stepwise Algorithm"),
            verbatimTextOutput("aic.out2"),

            br(),
            br(),

            strong('R session info'),
            verbatimTextOutput("info.out2")


            ),
#############################################################################################################################################			

        tabPanel("About",

            strong('Note'),
            p('This web application is developed with',
            a("Shiny.", href="http://www.rstudio.com/shiny/", target="_blank"),
            ''),

            br(),

            strong('List of Packages Used'), br(),
            code('library(shiny)'),br(),
            code('library(shinyAce)'),br(),
            code('library(psych)'),br(),
            code('library(car)'),br(),

            br(),

                      
            strong('Author'),
            p(a("Gentilini Davide,", href="https://labstat.wixsite.com/labstat", target="_blank"),' Ph.D.',br(),
            'Researcher',br(),
            'Medical and Genomic Statistics Unit /',br(),
            'Department of Brain and Behavioural Sciences ,',br(),
            'University of Pavia, Italy'),

            br(),

            p(br())

            )

))
))