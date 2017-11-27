cox2006means <-
    read_csv("data/table_COX2006_formants.csv") %>%
    filter(stat == "mean") %>% 
    select(Group = sex, Vowel = vowel, F1_average = f1_target1, F2_average = f2_target1) %>%
    filter(Vowel %in% c("FLEECE", "SQUARE", "BATH", "THOUGHT", "GOOSE")) %>%
    rowwise %>% 
    mutate(Vowel = switch(Vowel,
                          `FLEECE`  = "heed",
                          `SQUARE`  = "hair'd",
                          `BATH`    = "hard",
                          `THOUGHT` = "horde",
                          `GOOSE`   = "who'd"),
           Group = ifelse(Group == "male", "AusE male avg.", "AusE female avg."))

cox2006means %>%
    rbind(data.frame(
        stringsAsFactors = FALSE,
        Group       = "Participant",
        Vowel      = c("heed", "hard", "horde", "who'd", "hair'd"),
        F1_average = c(200, 700, 200, 300, 400),
        F2_average = c(2600, 1300, 750, 2000, 2100)
    )) %>% 
    ggplot(aes(x = F2_average, y = F1_average)) +
    geom_text(aes(label = Vowel, color = Group)) +
    scale_x_reverse() +
    scale_y_reverse() +
    theme_bw() +
    xlab("Second formant average") +
    ylab("First formant average") +
    ggtitle("A comparison of vowel formants from 5 /hVd/ words")
