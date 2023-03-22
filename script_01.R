library(dplyr)
library(ggplot2)

bolas <- c(1, 1, 2, 2, 3)
sample(x = bolas, replace = TRUE, size = 1)
sample(x = bolas, replace = TRUE, size = 5)
sample(x = bolas, replace = TRUE, size = 10)

media_exp <- function(bolas, n){
    experimento <- sample(x = bolas, replace = TRUE, size = n)
    mean(experimento)
}

repeticoes <- c(1, 2, 4, 8, 10, 50, 100, 500, 1000, 10000)
valores <- data.frame(n_i = rep(repeticoes, each = 10))


valores <- valores %>%
    rowwise() %>%
    mutate(media = media_exp(bolas, n = n_i))

ggplot(data = valores) +
    geom_hline(
        yintercept = 1.8, 
        col = "#00BFC4",
        lty=2
    ) + 
    geom_point(
        aes(x = factor(n_i), y = media),
        alpha = 0.3,
        size = 3.5,
        col = "firebrick"
    ) +
    theme_minimal() + 
    theme(
        panel.grid.minor = element_blank()
    )
