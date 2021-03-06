library(tidyverse)
library(magick)

create_cover_image <- function (korean_name) {
  
  base_img_loc <- here::here("assets/cover.png")
  
  base_image <- magick::image_read(base_img_loc) %>% 
    image_resize("1524x2000") # A4 --> 3508 x 2480
  
  # Annotate base image
  text <- glue::glue("Tidyverse Korea: {korean_name}")
  
  final <- magick::image_annotate(base_image, text, size = 60, color = "midnightblue",
                                  degrees = 0,  location = "+150+800", font = "NanumGothic")
  
  return(final)
}

create_cover_image("한글")