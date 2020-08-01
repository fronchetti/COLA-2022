library(readr)
library(ggplot2)
library(tidyr)
install.packages("splitstackshape")
library(splitstackshape)

survey <- read_csv("Documents/Ladder Logic (Survey)/data/survey/Survey - Can you understand Ladder Logic (Complete) - Responses.csv")

RD1 <- table(survey$`RD1 - Please select the role most applicable to you:`, dnn = list("Occupancy"))
respondents_occupancy <- as.data.frame(RD1, responseName = "Frequency")
ggplot(respondents_occupancy, aes(x=Occupancy,y=Frequency,fill=Occupancy,color=Occupancy)) + geom_bar(stat="identity")

RD2 <- table(survey$`RD2 - How many years of previous programming experience do you have?`, dnn = list("Experience"))
respondents_prog_experience <- as.data.frame(RD2, responseName = "Frequency")
ggplot(respondents_prog_experience, aes(x=Experience,y=Frequency)) + geom_bar(stat="identity")

RD3 <- table(survey$`RD3 - Do you have any prior experience with Programmable Logic Controllers?`, dnn = list("Experience"))
respondents_plc_experience <- as.data.frame(RD3, responseName = "Frequency")
ggplot(respondents_plc_experience, aes(x=Experience,y=Frequency)) + geom_bar(stat="identity")

RD4 <- concat.split(survey, "RD4 - Which programming languages do you use to write code for Programmable Logic Controllers?", ",", drop = FALSE)
RD4 <- data.frame(lapply(RD4, as.character), stringsAsFactors = FALSE)
RD4 <- na.omit(stack(x=RD4, select=29:33))
RD4 <- table(RD4$values, dnn = list("Language"))
respondents_iec_experience <- as.data.frame(RD4, responseName = "Frequency")
ggplot(respondents_iec_experience, aes(x=Language,y=Frequency)) + geom_bar(stat="identity")
