library("eRm")
source("convert_to_binary.R")

rm_1 <- RM(responses_matrix)
betas <- -coef(rm_1)
round(sort(betas), 2)

plotjointICC(rm_1, item.subset = 1:10, cex = .6, lwd=1.5 )
abline(h = .5, col = "black")
abline(v = 0, col = "black")
abline(v = -2.05, col = "black")
abline(v = 1.40, col = "black")
abline(h = .2, col = "black")
plotPImap(rm_1, cex.gen = .8, sorted = TRUE, irug = TRUE)
