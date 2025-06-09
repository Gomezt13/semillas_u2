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

plot1 <- readJPEG("img1.jpg") %>% grid::rasterGrob()
plot2 <- readJPEG("img2.jpg") %>% grid::rasterGrob()
plot3 <- readJPEG("img3.jpg") %>% grid::rasterGrob()
plot4 <- readJPEG("img4.jpg") %>% grid::rasterGrob()
plot5 <- readJPEG("img5.jpg") %>% grid::rasterGrob()


## Grid plots

top1 <- list(plot1, plot2, plot3, plot4, plot5) %>% 
  plot_grid(plotlist = .
            , labels = "AUTO"
            , nrow = 1
  )

top1 %>% ggsave2(plot = .
                , filename = "Figure-11.jpg"
                , units = "cm"
                , width = 33
                , height = 9
)
