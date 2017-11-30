library(shiny)
library(ggplot2)
library(dplyr)

# F1, F2 of vowel target1 list in Appendix 2 (females) and Appendix 3 (males)
# of Cox (2006): https://doi.org/10.1080/07268600600885494
cox2006 <-
    expand.grid(
        Vowel = c("heed",  "hair'd", "hard", "horde", "who'd"),
        Group = c("AusE females", "AusE Males")
    ) %>% cbind(
           F1 = c(391, 529, 955, 494, 399,     # females
                  320, 452, 757, 439, 341),
           F2 = c(2729, 2389, 1525, 954, 2138, # females
                  2339, 2092, 1349, 846, 1796)
    )

ui <- fluidPage(
    
    tags$head(
        tags$style(HTML("
            h2 { font-size: 1em }
        "))
    ),
    
    titlePanel("Plot F1-F2 values against AusE averages"),
    
    p("This app helps you plot first and second formant values against data for Australian-English speakers reported by",
      a(href = "http://dx.doi.org/10.1080/07268600600885494", target = "_blank", "Cox (2006)")),

    fluidRow(
        column(width = 2,
               textInput("group_label", "Initials", value = "NS")        
       ),
       
       column(width = 2,
              numericInput("heed_f1", "Heed, F1", 200),
              numericInput("heed_f2", "Heed, F2", 2500)
       ),

       column(width = 2,
              numericInput("haird_f1", "Hair'd, F1", 400),
              numericInput("haird_f2", "Hair'd, F2", 1900)
       ),
       
       column(width = 2,
              numericInput("hard_f1", "Hard, F1", 700),
              numericInput("hard_f2", "Hard, F2", 1200)
       ),
       
       column(width = 2,
              numericInput("horde_f1", "Horde, F1", 400),
              numericInput("horde_f2", "Horde, F2", 800)
       ),
       
       column(width = 2,
              numericInput("whod_f1", "Who'd, F1", 300),
              numericInput("whod_f2", "Who'd, F2", 1600)
       )
    ),
    
    hr(),
    
    fluidRow(
        column(width = 12, align = "center",
               plotOutput("vowel_plot", width = "800px", height = "700px")
        )
    )
)

server <- function(input, output) {
    output$vowel_plot <- renderPlot({
        cox2006 %>%
            rbind(data.frame(
                Group = input$group_label,
                Vowel = c("heed", "hard", "horde", "who'd", "hair'd"),
                F1    = c(input$heed_f1, input$hard_f1, input$horde_f1, input$whod_f1, input$haird_f1),
                F2    = c(input$heed_f2, input$hard_f2, input$horde_f2, input$whod_f2, input$haird_f2)
                )
            ) %>% 

            ggplot(aes(x = F2, y = F1)) +
            geom_text(aes(label = Vowel, color = Group),
                      size = 8, show.legend = FALSE) +
            geom_point(aes(color = Group)) +
            scale_x_reverse() +
            scale_y_reverse() +
            xlab("Second formant (Hz)") +
            ylab("First formant (Hz)") +
            theme_bw(base_size = 20) +
            ggtitle("A comparison of vowel formants from 5 /hVd/ words")
    })
}

shinyApp(ui, server)
