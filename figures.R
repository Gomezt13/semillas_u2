setup <- tempfile(fileext = ".r")
readLines(con = 'https://inkaverse.com/docs.r') |> 
  gsub("echo = FALSE", "echo = TRUE", x = _) |>
  writeLines(setup)
source(setup)

library(tidyverse)
library(magick)
library(cowplot)
library(tiff)
library(png)
library(jpeg)

sessionInfo()


plot01 <- readJPEG("colo.jpg") %>% grid::rasterGrob()
plot02 <- readJPEG("etiq.jpg") %>% grid::rasterGrob()
plot03 <- readJPEG("alma.jpg") %>% grid::rasterGrob()


## Grid plots

top <- list(plot01, plot02, plot03) %>% 
  plot_grid(plotlist = .
            , labels = "AUTO"
            , nrow = 1
  )

top %>% ggsave2(plot = .
                , filename = "Figure-10.jpg"
                , units = "cm"
                , width = 20
                , height = 9
)