library(ltm)
source("convert_to_binary.R")
descript(responses_matrix)

fit1 <- rasch(responses_matrix, constraint = cbind(length(responses_matrix) + 1 , 1))
summary(fit1)
coef(fit1, prob = TRUE, order = TRUE)

fit2 <- tpm(responses_matrix, type = "rasch", max.guessing = 1)
summary(fit2)
coef(fit2)
par(mfrow = c(2, 2))
plot(fit2, legend = TRUE, cx = "bottomright", lwd = 1, cex.main = 1.5, cex.lab = 1.3, cex = 1.1)
plot(fit2, type = "IIC", annot = FALSE, lwd = 1, cex.main = 1.5, cex.lab = 1.3)
plot(fit2, type = "IIC", items = 0, lwd = 1, cex.main = 1.5, cex.lab = 1.3)
plot(0:1, 0:1, type = "n", ann = FALSE, axes = FALSE)
info1 <- information(fit2, c(-4, 0))
info2 <- information(fit2, c(0, 4))
text(0.5, 0.5, labels = paste("Total Information:", round(info1$InfoTotal, 3),
                              "\n\nInformation in (-4, 0):", round(info1$InfoRange, 3),
                              paste("(", round(100 * info1$PropRange, 2), "%)", sep = ""),
                              "\n\nInformation in (0, 4):", round(info2$InfoRange, 3),
                              paste("(", round(100 * info2$PropRange, 2), "%)", sep = "")), cex = 1.5)

## TUTORIAL 2

IRTmodel = ltm(responses_matrix ~ z1, IRT.param = TRUE)
coef(IRTmodel)
plot(IRTmodel, type = "ICC")
factor.scores(IRTmodel)
person.fit(IRTmodel)
item.fit(IRTmodel)

IRTmodel2 = tpm(responses_matrix, type="latent.trait", IRT.param = TRUE, start.val = "random")
coef(IRTmodel2)
plot(IRTmodel2, type = "ICC")
factor.scores(IRTmodel2)
person.fit(IRTmodel2)
item.fit(IRTmodel2)
anova(IRTmodel, IRTmodel2)

