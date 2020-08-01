library("eRm")
source("convert_to_binary.R")

rm_1 <- RM(responses_matrix)
betas <- -coef(rm_1)
round(sort(betas), 2)

plotjointICC(rm_1, item.subset = 1:10, cex = .6, lwd=1.5 )
abline(h = .5, col = "gray")
abline(v = 0, col = "black")
plotPImap(rm_1, cex.gen = .8, sorted = TRUE, irug = TRUE)

set.seed(210485)
t10 <- NPtest(as.matrix(responses_matrix),n=1000,method="T10")
t10

Tpbis1 <- NPtest(as.matrix(responses_matrix),n=1000,method="Tpbis",idxt=1,idxs=2:6)
Tpbis1

lrres <- LRtest(rm_1,se=TRUE)
plotGOF(lrres,conf=list())
plotPWmap(rm_1)