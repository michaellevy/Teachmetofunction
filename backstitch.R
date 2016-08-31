library(ggplot2)

x <- rep(c(3, 5, 8, 10, 13, 16, 18, 22, 25, 28), 6)
y <- rep(c(1, 1.5, 2, 6, 6.5, 7), each = 10)
text <- rep(c(" ", "Matt Lieber is a cool summer's day"), 30)
d <- data.frame(cbind(x, y))
d
p <- ggplot(d, aes(x = x, y = y)) + geom_segment(aes(xend = x + 1, yend = y + 0), lineend = "round") + coord_flip()
p

emb_theme <- theme(panel.background = element_blank(),
                   panel.border = element_rect(fill = NA, color = "gray50", linetype = "solid"),
                   panel.margin = unit(1.5, "cm"), 
                   axis.title = element_blank(),
                   axis.text = element_blank(), 
                   axis.ticks = element_blank(),
                   legend.position = "none")

p + geom_text(aes(x = 20, y = 4, label = "Matt Lieber is \nthe flipside of your pillow",
                              size = 12, family = "mono")) + emb_theme
