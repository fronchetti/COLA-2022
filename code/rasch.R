library("eRm")
source("convert_to_binary.R")

trace(grDevices::png, quote({
  if (missing(type) && missing(antialias)) {
    type <- "cairo-png"
    antialias <- "subpixel"
  }
}), print = FALSE)

rm_1 <- RM(responses_matrix)
betas <- -coef(rm_1)
round(sort(betas), 2)
plotjointICC(rm_1, item.subset = 1:10, cex = .6, lwd=1.5 )

# abline(h = .5, col = "gray")
# abline(v = 0, col = "black")
plotPImap(rm_1, cex.gen = .8, sorted = TRUE, irug = TRUE)
