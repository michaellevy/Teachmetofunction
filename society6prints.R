# Function to export Society Six Prints in the correct resolution

tomm <- function(width, height, dpi = 300) {
  widthout = (width * 25.4) / dpi
  heightout = (height * 25.4) / dpi
  return(c(widthout, heightout))
}

tomm(1300, 2000)

# this function works, but if you're building a plot in base R, you have to first save it as an object with recordPlot(), then run the function with the plot name.


phone <- function(filename, plot) {
  if(class(plot) == "recordedplot"){
    dev.print(jpeg, file = filename, width = 1300, height = 2000)
    jpeg(file = filename, width = 1300, height = 2000, quality = 300, units = "px")
    dev.off()
    }else{
  ggsave(filename = filename, plot = plot, width = 110.0667, height = 169.34, dpi = 300, units = "mm") 
    }
}

phone(filename = "testphone_rplot2.jpeg", plot = p)

tshirt <- function(filename, plot) {
  if(class(plot) == "recordedplot"){
    dev.print(jpeg, file = filename, width = 3300, height = 5100)
    jpeg(file = filename, width = 3300, height = 5100, quality = 300, units = "px")
    dev.off()
  }else{
    ggsave(filename = filename, plot = plot, width = 431.8, height = 279.4, dpi = 300, units = "mm") 
  }
}

tshirt(filename = "iwillneverfinish_shirt.jpeg", plot = p)

tshirt_allover <- function(filename, plot) {
  if(class(plot) == "recordedplot"){
    dev.print(jpeg, file = filename, width = 6000, height = 6000)
    jpeg(file = filename, width = 6000, height = 6000, quality = 300, units = "px")
    dev.off()
  }else{
    ggsave(filename = filename, plot = plot, width = 508, height = 508, dpi = 300, units = "mm") 
  }
}

tshirt_allover(filename = "iwillnever_allover.jpeg", plot = p)

p
# adjust y axis:

# Extract Samples from Posterior

load("~/Dropbox/GitHubRepos/gst_rheo/R/m2NC.Rdata")
post <- extract.samples(m2NC)

## Fig 4.b: sample 300 trials in the posterior for each treatment
par(mar = c(0, 0, 0, 0), xaxs='i', yaxs='i')
par(mai = c(0, 0, 0, 0))
par(omi = c(0,0,0,0))
par(oma = c(0,0,0,0))

plot(NULL, xlim = c(0, 1) , ylim = c(0, 3) ,
     xlab = " ", ylab = " ", bty = "n", col.axis = "white", lab = NULL,
     xaxt = "n", yaxt = "n", tck = 0, xpd = NA)

 for (i in 1:300)
  curve( rnorm(x, logistic(post$b_above[i]), logistic(post$sigma_fish[i])), add = TRUE,
         col = col.alpha("black", 0.5))

p <- recordPlot()
p
