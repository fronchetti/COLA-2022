install.packages("effsize")
library(effsize)

data <- read.csv("../data/survey/Performances.csv", fileEncoding="UTF-8-BOM")

# Comparing respondents performance based on groups of questions
# In this first part of our statistical analysis, we divide the performances of 
# our respondents per question in different groups. Our objective is to understand
# the differences in performance of our respondents for each group of questions, 
# in order to understand, for example, if they had a better performance in questions
# where the diagram had one rung, or in questions where the diagram had two rungs.

# Questions asking the respondent to read a diagram x to write a diagram
summary(data$ReadPercentage)
summary(data$WritePercentage)
wilcox.test(data$ReadPercentage, data$WritePercentage)
cliff.delta(data$ReadPercentage, data$WritePercentage, return.dm=TRUE)  

# Questions where the question and/or answer is an one-rung diagram x a two-rungs diagram
summary(data$OneRungPercentage)
summary(data$TwoRungsPercentage)
wilcox.test(data$OneRungPercentage, data$TwoRungsPercentage)
cliff.delta(data$OneRungPercentage, data$TwoRungsPercentage, return.dm=TRUE)  

# Questions containing multiple types of inputs x single type of input
summary(data$MultipleTypesPercentage)
summary(data$SingleTypePercentage)
wilcox.test(data$MultipleTypesPercentage, data$SingleTypePercentage)
cliff.delta(data$MultipleTypesPercentage, data$SingleTypePercentage, return.dm=TRUE)  

# Questions containing closed contacts x not containing closed contacts
summary(data$ConstainsClosedRungPercentage)
summary(data$DoesNotContainClosedRungPercentage)
wilcox.test(data$ConstainsClosedRungPercentage, data$DoesNotContainClosedRungPercentage)
cliff.delta(data$ConstainsClosedRungPercentage, data$DoesNotContainClosedRungPercentage, return.dm=TRUE)  

# Comparing respondents performance based on their demographic answers
# In this second part of our analysis, we compare the performance of respondents
# based on the information that they provided in the demographics section of our
# study. Our objective with this analysis is to understand which groups of
# respondents had a better performance.

# Programming Experience

# No programming experience x +5 years of programming experience
summary(data$ProgExpNoExperience)
summary(data$ProgExpPlus5Years)
wilcox.test(data$ProgExpNoExperience, data$ProgExpPlus5Years)
cliff.delta(data$ProgExpNoExperience, data$ProgExpPlus5Years, return.dm=TRUE) 

# No programming experience x 3 to 5 years of programming experience
summary(data$ProgExpNoExperience)
summary(data$ProgExp3To5Years)
wilcox.test(data$ProgExpNoExperience, data$ProgExp3To5Years)
cliff.delta(data$ProgExpNoExperience, data$ProgExp3To5Years, return.dm=TRUE)

# No programming experience x 1 to 2 years of programming experience
summary(data$ProgExpNoExperience)
summary(data$ProgExp1To2Years)
wilcox.test(data$ProgExpNoExperience, data$ProgExp1To2Years)
cliff.delta(data$ProgExpNoExperience, data$ProgExp1To2Years, return.dm=TRUE) 

# No programming experience x < 1 year of programming experience
summary(data$ProgExpNoExperience)
summary(data$ProgExpLess1Year)
wilcox.test(data$ProgExpNoExperience, data$ProgExpLess1Year)
cliff.delta(data$ProgExpNoExperience, data$ProgExpLess1Year, return.dm=TRUE)

# PLC Experience

# No PLC experience x +5 years of PLC experience
summary(data$PLCExpNoExperience)
summary(data$PLCExpPlus5Years)
wilcox.test(data$PLCExpNoExperience, data$PLCExpPlus5Years)
cliff.delta(data$PLCExpNoExperience, data$PLCExpPlus5Years, return.dm=TRUE) 

# No PLC experience x 3 to 5 years of PLC experience
summary(data$PLCExpNoExperience)
summary(data$PLCExp3To5Years)
wilcox.test(data$PLCExpNoExperience, data$PLCExp3To5Years)
cliff.delta(data$PLCExpNoExperience, data$PLCExp3To5Years, return.dm=TRUE)

# No PLC experience x 1 to 2 years of PLC experience
summary(data$PLCExpNoExperience)
summary(data$PLCExp1To2Years)
wilcox.test(data$PLCExpNoExperience, data$PLCExp1To2Years)
cliff.delta(data$PLCExpNoExperience, data$PLCExp1To2Years, return.dm=TRUE) 

# No PLC experience x < 1 year of PLC experience
summary(data$PLCExpNoExperience)
summary(data$PLCExpLess1Year)
wilcox.test(data$PLCExpNoExperience, data$PLCExpLess1Year)
cliff.delta(data$PLCExpNoExperience, data$PLCExpLess1Year, return.dm=TRUE)


wilcox.test(data$LanguageExpNoExp, data$LanguageExpMinimum)
cliff.delta(data$LanguageExpNoExp, data$LanguageExpMinimum, return.dm=TRUE)

wilcox.test(data$PLCExpNoExperience, data$PLCExpMinimum)
cliff.delta(data$PLCExpNoExperience, data$PLCExpMinimum, return.dm=TRUE)

wilcox.test(data$ProgExpNoExperience, data$ProgExpMinimum)
cliff.delta(data$ProgExpNoExperience, data$ProgExpMinimum, return.dm=TRUE)