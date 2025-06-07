# Seed collection

source("https://inkaverse.com/setup.r")

url <- "https://docs.google.com/spreadsheets/d/12HD5TUu2mDQ2YbjxtKw6sNQqbi1519lyLADSrtXNTs8/edit?gid=150361058#gid=150361058"

gs <- as_sheets_id(url)

fb <- gs %>% 
  range_read("re")

font <- c("Courgette", "Tillana")

huito_fonts(font)

label <- fb %>% 
  mutate(name = paste0('"', "Garbanzo", '"')) %>% 
  label_layout(size = c(4, 1)
                   , border_color = "orangered4"
                   ) %>% 
  include_barcode(
    value = "qrcode"
    , size = c(1, 1)
    , position = c(3.3, 0.5)
  ) %>%
  include_text(value = "fer"
                   , position = c(1.25, 0.5)
                   , size = 9
                   , color = "black"
                   , font[1] 
                    ) 
label %>% label_print()

label1 <- fb %>% 
  mutate(name = paste0('"', "Garbanzo", '"')) %>% 
  label_layout(size = c(6, 2)
               , border_color = "orangered4"
  ) %>% 
  include_image(
    value = "https://yt3.googleusercontent.com/ytc/AIdro_ka-7D7fE6y102_Z6Dtw6omq5k_y2MkHu_AQhI3CXSKGQ=s900-c-k-c0x00ffffff-no-rj"
    , size = c(1, 1)
    , position = c(5, 0.75)
  ) %>% 
  include_image(
    value = "https://upload.wikimedia.org/wikipedia/commons/9/95/Logo-2016-solo-ok.png"
    , size = c(1, 1)
    , position = c(1, 0.75)
  ) %>%
  include_text(value = "Muestrario de semillas monocotiledóneas"
               , position = c(3, 1.5)
               , size = 8.5
               , color = "black"
               , font[1] 
  ) %>% 
  include_text(value = "Grupo F"
               , position = c(3, 0.8)
               , size = 9
               , color = "dodgerblue4"
               , font[2]
  )
label1 %>% label_print()

# Crear una lista con varias etiquetas, por ejemplo:
etiquetas <- c(
  rep(list(label), 4),   # 4 etiquetas del tipo label
  rep(list(label1), 2)   # 2 etiquetas del tipo label1
)

# Generar la página
pagina <- label_page(etiquetas, ncol = 2, nrow = 3)

# Imprimir la página
label_print(pagina)

