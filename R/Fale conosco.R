rm(list = ls())

if('LDA' %in% installed.packages() == FALSE){
  remotes::install_github('cgmobility/LDA')
}

library(LDA)
library(htmltools)
library(htmlwidgets)

wd()



head_tags <- tags$head(
  tags$meta(charset = "utf-8"),
  tags$meta(name = "viewport", content = "width=device-width, initial-scale=1"),
  tags$title("Papo de Pedal"),
  tags$link(href = 'https://fonts.googleapis.com/css?family=Montserrat',rel = 'stylesheet'),
  tags$style(HTML("
    body { font-family: Montserrat, Roboto, Arial, sans-serif; margin: 0; }
  ")),
  tags$link(rel = "stylesheet", href = "../css/style.css"),
  tags$link(rel = "shortcut icon",href = "../css/ico_bora_de_bike.png",
            type = "image/png")
)

body_tags <- tags$body(
  tags$div(
    style = 'width: 100%; background-color: #58B3A6; height: 20px;'
  ),
  tags$div(
    style = 'width: 100%; height:60px; background-color: white; display: flex;',
    tags$div(
      style = 'margin-left:auto;margin-right:auto;margin-top:auto; margin-bottom:auto;',
      tags$a(
        class = "page_unselected",
        'Início',
        href = '../home/index.html'
      ),
      tags$a(
        class = "page_unselected",
        'Sobre o projeto',
        href = '../sobre/sobre.html'
      ),
      tags$a(
        class = "page_selected",
        'Fale conosco',
        href = 'contato.html'
      )
    )
  ),
  tags$div(
    style = 'position:relative;display:inline-block;',
    tags$img(
      src = '../css/image15.jpg',style = 'width:100%;display:block;'
    ),
    tags$div(
      style = 'position: absolute;inset:0;background: #00000060;',
      tags$h1(
        'Papo de Pedal',
        style = 'margin-left:5%;color:white;font-size:4vw;width:30%;'
      ),
      tags$h3(
        'Fale conosco',
        style = 'margin-left:5%;color:white;width:30%;font-size:3vw'
      )
    ),
    tags$div(
      style = 'position: absolute;top:10%;right:4%;display:flex;align-items:center;
      gap:12px;',
      tags$img(
        src = '../css/image12.png',style = 'height:40px;display:block;'
      ),
      tags$img(
        src = '../css/image7.png',style = 'height:40px;display:block;'
      ),
      tags$img(
        src = '../css/image6.png',style = 'height:40px;display:block;'
      )
    )
  ),
  tags$div(
    style = "width:100%;height:100vh;position:relative;",
    tags$iframe(
      src = "https://boradebike.vercel.app",
      style = "width:100%;height:100vh;top:-150px;bottom:-240px;position:absolute;",
      tags$a("https://boradebike.vercel.app/contato")
    )
  ),
  tags$div(
    class = 'basefoot',
    tags$div(
      class = 'row',
      tags$div(
        class = 'foot_img',
        tags$img(
          src = '../css/foot_boradebike.svg',
          alt = 'Bora de Bike'
        )
      ),
      tags$div(
        class = 'foot_img',
        tags$img(
          src = '../css/foot_amc.svg',
          alt = 'AMC'
        )
      ),
      tags$div(
        class = 'foot_img',
        tags$img(
          src = '../css/foot_prefeitura.svg',
          alt = 'Logo Prefeitura de Fortaleza'
        )
      )
    ),
    tags$div(
      class = 'row',
      style = 'margin-top:20px;',
      tags$div(
        class = 'foot_img',
        tags$h4(
          style = "color:white;margin:0px;",
          'E-mail para contato:'
        ),
        tags$a(
          href = 'mailto:ggciclo.amc@gmail.com',
          tags$div(
            class = 'circle_img',
            tags$img(
              src = '../css/ico_email.svg',
              alt = "Email de contato"
            )
          ),
          tags$p(
            "ggciclo.amc@gmail.com",
            style = "color:white;"
          )
        )
      ),
      tags$div(
        class = 'foot_img',
        tags$h4(
          style = "color:white;margin:0px;",
          'Conheça mais em:'
        ),
        tags$a(
          href = 'https://www.instagram.com/amctransito',
          tags$div(
            class = 'circle_img',
            tags$img(
              src = '../css/ico_insta.svg',
              alt = "Instagram"
            )
          ),
          tags$p(
            "@amctransito",
            style = "color:white;"
          )
        )
      )
    )
  )
)

page <- tags$html(lang = "pt-BR", head_tags, body_tags)


save_html(page, file = '../contato/contato.html')


