
tomm <- function(width, height, dpi = 300) {
  widthout = (width * 25.4) / dpi
  heightout = (height * 25.4) / dpi
  return(c(widthout, heightout))
}

tomm(width = 1300, height = 3000)
