# adjust y axis:

# Extract Samples from Posterior
load("~/Dropbox/GitHubRepos/gst_rheo/R/m2NC.Rdata")
post <- extract.samples(m2NC)

## Fig 4.b: sample 300 trials in the posterior for each treatment
par(mar = c(0, 0, 0, 0))
plot(NULL, xlim = c(0, 1) , ylim = c(0, 3) ,
     xlab = " ", ylab = " ", bty = "n", col.axis = "white", lab = NULL,
     xaxt = "n", yaxt = "n")

for (i in 1:300)
  curve( rnorm(x, logistic(post$b_above[i]), logistic(post$sigma_fish[i])), add = TRUE,
         col = col.alpha("black", 0.5))
