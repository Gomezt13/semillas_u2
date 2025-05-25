# Seed collection

source("https://inkaverse.com/setup.r")
url <- "https://docs.google.com/spreadsheets/d/1HULLeNVuUZ9JhBPeuIET7slsfKvgOy3W0z_Cre3ns5w/edit?gid=876483088#gid=876483088"
gs <- as_sheets_id(url)
  
fb <- gs %>% 
  range_read("fb")

font <- c("Courgette", "Tillana")

huito_fonts(font)

label <- fb %>% 
  mutate(name = paste0('"', "Garbanzo", '"')) %>% 
  label_layout(size = c(5, 5)
               , border_color = "darkgreen"
               ) %>% 
  include_image(
    value = "https://huito.inkaverse.com/img/scale.pdf"
    , size = c(5, 1)
    , position = c(2.5, 0.5)
  ) %>% 
  include_image(
    value = "https://goldenriseagri.com/wp-content/uploads/2022/09/chick-peas-1.png"
    , size = c(1.5, 3)
    , position = c(4.1, 1.5)
    ) %>% 
  include_image(
    value = "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?cs=srgb&dl=pexels-francesco-ungaro-396547.jpg&fm=jpg"
    , size = c(5, 5)
    , position = c(2.5, 6)
    ) %>% 
  include_image(
    value = "https://cce.untrm.edu.pe/img/logo.png"
    , size = c(2.2, 1.9)
    , position = c(1.2, 4.6)
    ) %>%
  include_image(
    value = "https://grupof.com.py/wp-content/uploads/2023/10/GRUPO-F_logo-1021x1024.png"
    , size = c(1, 1)
    , position = c(4.5, 4.6)
  ) %>%
  include_barcode(
     value = "qrcode"
     , size = c(2, 2)
     , position = c(4, 3)
     ) %>% 
  include_text(value = "Familia:"
               , position = c(0.5, 3.1)
               , size = 6
               , color = "black"
               , opts = list(hjust = 0)
              ) %>% 
    include_text(value = "Fabaceae"
                 , position = c(1, 2.8)
                 , size = 6
                 , color = "black"
                 , opts = list(hjust = 0)
                ) %>% 
  include_text(value = "Genero:"
               , position = c(0.5, 2.5)
               , size = 6
               , color = "black"
               , opts = list(hjust = 0)
              ) %>% 
  include_text(value = "Cicer"
               , position = c(1, 2.2)
               , size = 6
               , color = "black"
               , opts = list(hjust = 0)
                ) %>% 
  include_text(value = "plots"
               , position = c(0.25, 3.7)
               , size = 6
               , color = "black"
               , opts = list(hjust = 0)
  ) %>% 
  include_text(value = "induccion-germinacion"
               , position = c(0.75, 3.7)
               , size = 6
               , color = "black"
               , opts = list(hjust = 0)
  ) %>% 
  include_text(value = "Cicer arietinum"
               , position = c(2, 1.8)
               , size = 9
               , color = "black"
               , font[1] 
              ) %>% 
  include_text(value = "name"
               , position = c(2, 1.3)
               , size = 9
               , color = "black"
               , font[2]
              )
label %>% label_print()

label %>% label_print(mode = "c")



