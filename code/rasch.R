library("eRm")
source("convert_to_binary.R")

write.csv(responses_matrix, "../data/responses.csv")

# Train the rasch model
rm_1 <- RM(responses_matrix)
# Get the beta values for each question
betas <- -coef(rm_1)
round(sort(betas), 2)
# Plot the item characteristic curve
plotjointICC(rm_1, item.subset = 1:10, cex = .6, lwd=1.5 )
# Plot the person-item map
plotPImap(rm_1, cex.gen = .8, sorted = TRUE, irug = TRUE)
