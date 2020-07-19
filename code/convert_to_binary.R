library(readr)

survey <- read_csv("../data/survey/Survey - Can you understand Ladder Logic (Complete) - Responses.csv")

# Convert responses to dichotomous variables
W1 <- with(survey[,8], ifelse(survey[,8] == "1 - Correct structure, symbols and labels", 1, 0))
W2 <- with(survey[,10], ifelse(survey[,10] == "1 - Correct structure, symbols and labels", 1, 0))
W3 <- with(survey[,12], ifelse(survey[,12] == "1 - Correct structure, symbols and labels", 1, 0))
W4 <- with(survey[,14], ifelse(survey[,14] == "1 - Correct structure, symbols and labels", 1, 0))
W5 <- with(survey[,16], ifelse(survey[,16] == "1 - Correct structure, symbols and labels", 1, 0))
R1 <- with(survey[,9], ifelse(survey[,9] == "Light will only be turned ON when both Button A and Button B are ON.", 1, 0))
R2 <- with(survey[,11], ifelse(survey[,11] == "Water Pump will be turned ON when the Button is ON and the Water Level Detector is OFF.", 1, 0))
R3 <- with(survey[,13], ifelse(survey[,13] == "Light will be turned ON when Button A and Button B have different states (ON and OFF or OFF and ON)", 1, 0))
R4 <- with(survey[,15], ifelse(survey[,15] == "Alarm will be turned ON when both the Smoke and Carbon Monoxide detectors are ON, or when the Test Button is ON.", 1, 0))
R5 <- with(survey[,17], ifelse(survey[,17] == "Boiler will be turned ON when the Start Button is ON, and the Stop Button and Heat Sensor are OFF.", 1, 0))

responses_matrix <- data.frame(W1, W2, W3, W4, W5, R1, R2, R3, R4, R5)
names(responses_matrix) <- c("W1", "W2", "W3", "W4", "W5", "R1", "R2", "R3", "R4", "R5")
