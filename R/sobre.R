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
        class = "page_selected",
        'Sobre o projeto',
        href = 'sobre.html'
      ),
      tags$a(
        class = "page_unselected",
        'Fale conosco',
        target = "_blank",
        href = 'https://boradebike.vercel.app/contato'
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
        'Sobre o projeto',
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
    tags$link(rel = "stylesheet", href = "../css/sobre.css"),
    tags$div(
      class = "papo-pedal",
      
      tags$h1("Papo de Pedal"),
      
      tags$section(
        class = "section",
        `aria-label` = "Introdução",
        tags$h2("Introdução"),
        tags$p(
          "O Papo de Pedal nasce como solução para um dos principais desafios na construção de políticas púbicas do setor ",
          "de mobilidade em grandes centros urbanos: a escuta detalhada e localizada de demandas da população. A importante ",
          "iniciativa de engajamento da política cicloviária de Fortaleza promove o encontro entre técnicos da administração ",
          "pública com ciclistas em diversos locais da cidade, construindo pontes entre visões mais analíticas sobre determinados ",
          "projetos e anseios de um público que muitas vezes não consegue tempo para se fazer ouvir. Por estabelecer a necessidade ",
          "de deslocamentos muito longos no cotidiano de quem pedala – segmento que tem o trabalho como principal motivo gerador ",
          "de viagens –, a dinâmica urbana da capital cearense exigia uma estratégia diferente para esses contatos. E essa demanda ",
          "foi respondida com um formato de encontros estruturados, baseados na coleta direta de informação a partir de entrevistas ",
          "pré-definidas para transformar diálogos abertos em dados. O Papo de Pedal é a representação do contato entre população e ",
          "Poder Público subsidiando projetos focados em pessoas."
        )
      ),
      
      tags$section(
        class = "section",
        `aria-label` = "Prêmio Bicicleta Brasil",
        tags$h2("A iniciativa é reconhecida pelo Prêmio Bicicleta Brasil"),
        
        tags$div(
          class = "award",
          tags$a(
            href = "https://www.gov.br/cidades/pt-br/acesso-a-informacao/acoes-e-programas/mobilidade-urbana/programa-bicicleta-brasil/selo-do-programa-bicicleta-brasil",
            target = "_blank",
            rel = "noopener noreferrer",
            title = "Abrir site do Prêmio Bicicleta Brasil",
            tags$img(
              src = "../css/bicicleta_brasil.jpg",
              alt = "Selo do Prêmio Bicicleta Brasil"
            )
          ),
          tags$div(
            tags$strong("Reconhecimento nacional"),
            tags$span("O Papo de Pedal ganhou o Prêmio Bicicleta Brasil.")
          )
        ),
        
        tags$p(
          class = "muted",
          style = "margin-top:10px;",
          "Clique no selo para acessar o site do prêmio."
        )
      ),
      
      tags$section(
        class = "section",
        `aria-label` = "Metodologia",
        tags$h2("Metodologia"),
        tags$p(
          "As conversas do Papo de Pedal são realizadas presencialmente, com registro individual em áudio para cada participante. ",
          "Embora o diálogo seja aberto, utiliza-se um roteiro técnico pré-definido, que orienta a condução das entrevistas e garante ",
          "a coleta padronizada de informações essenciais. Todos os áudios são organizados em ambiente digital e exportados no formato ",
          ".opus, assegurando uniformidade no tratamento dos arquivos. ",
          "A transcrição dos áudios é realizada de forma automatizada por meio de uma API integrada via linguagem Python, convertendo o ",
          "conteúdo oral em texto e criando a base necessária para o processamento computacional das entrevistas. ",
          "As transcrições são então importadas para a linguagem R, onde ocorre a análise dos dados textuais. ",
          "Para cada edição, uma solução de inteligência artificial é utilizada para analisar os textos, estruturar as respostas e ",
          "parametrizar os resultados, permitindo o agrupamento de conteúdos em temas comuns e a identificação de padrões recorrentes."
        )
      )
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


save_html(page, file = '../sobre/sobre.html')


