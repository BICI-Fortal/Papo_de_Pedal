rm(list = ls());

library(LDA)
library(leaflet)
library(htmltools)

wd()

path <- Sys.getenv('papo_pedal_project_path')


# data --------------------------------------------------------------------


descriptions <- list.files(
  path = path,
  pattern = 'description.txt',
  full.names = T,recursive = T
)

fortaleza <- get_layer('Bairros_de_Fortaleza') %>% 
  read_sf() %>% 
  st_union()

edicoes <- lapply(descriptions, fread) %>% 
  bind_rows()

edicoes <- edicoes %>% 
  rename('data_edicao'='data') %>% 
  mutate(data_edicao = as.character(data_edicao))

internas <- read_excel(
  list.files(path = path,pattern = "edicoes_reuniao", recursive = T, full.names = T)
)


# functions ---------------------------------------------------------------



lbl_edition <- function(date){
  dt <- as.POSIXct(as.character(date),format = '%Y%m%d')
  paste0(
    'Edição ',
    sprintf('%02d',lubridate::day(dt)),'/',
    sprintf('%02d',lubridate::month(dt)),'/',
    lubridate::year(dt)
  ) %>% return()
}

tag_popup <- function(date,address,btn = T){
  if(btn){
    tags$div(
      class = 'popup_edicao',
      tags$h3('Edição: ',str_sub(date,-2),'/',
              str_sub(date,5,6),'/',str_sub(date,1,4)),
      tags$p(address),
      tags$button(
        class = 'btn-padrao',
        'Ir para edição',
        onclick = HTML(paste0('go_to_edition_son(\'',lbl_edition(date),'\');'))
      )
    ) %>% as.character()
  }else{
    tags$div(
      class = "popup_edicao",
      tags$h4('Edição: ',str_sub(date,-2),'/',
              str_sub(date,5,6),'/',str_sub(date,1,4)),
      tags$p(address)
    ) %>% as.character()
  }
  
}

tag_popup_interna <- function(date,address,description){
  tags$div(
    class = 'popup_edicao interna',
    tags$h3('Edição: ',format(as.Date(date),'%d/%m/%Y')),
    tags$p(address),
    tags$h4('Descrição:'),
    tags$p(description)
  ) %>% as.character()
}



# map ---------------------------------------------------------------------




a_icon <- makeAwesomeIcon(
  icon = 'bicycle',
  library = 'fa',
  iconColor = '#F15A22',
  markerColor = 'lightblue'
)

edicoes$popup_base <- apply(edicoes,1,function(x){
  tag_popup(x['data_edicao'],x['address'])
})

l <- leaflet() %>% 
  addAwesomeMarkers(data = edicoes,
                    lng = ~long, lat = ~lat, icon = a_icon,
                    popup = ~popup_base,
                    group = 'Base')

l <- l %>%
  addPolygons(data = fortaleza,fillOpacity = 0, color = '#414042') %>% 
  addProviderTiles(providers$CartoDB.Positron, group = 'Carto') %>% 
  addTiles(group = 'OSM') %>% 
  addProviderTiles(providers$Esri.WorldImagery,group = 'World') %>% 
  addLayersControl(overlayGroups = c('Base',edicoes$data_edicao),
                   baseGroups = c('Carto','World','OSM'))



b_icon <- makeAwesomeIcon(
  icon = 'bicycle',
  library = 'fa',
  iconColor = '#F15A22',
  markerColor = 'darkblue'
)


for (i in 1:nrow(edicoes)) {
  l <- l %>% 
    addAwesomeMarkers(data = edicoes[i,],
                      lng = ~long, lat = ~lat, icon = b_icon,
                      popup = tag_popup(
                        edicoes$data_edicao[i],
                        edicoes$address[i],F
                      ),
                      group = edicoes$data_edicao[i]) %>% 
    hideGroup(edicoes$data_edicao[i])
}


intern_icon <- makeAwesomeIcon(
  icon = 'bicycle',
  library = 'fa',
  iconColor = '#F15A22',
  markerColor = 'cadetblue'
)

internas$popup <- apply(internas,1,function(x){
  tag_popup_interna(x['data'],x['address'],x['description'])
})

l <- l %>% 
  addAwesomeMarkers(data = internas,
                    lng = ~long, lat = ~lat, icon = intern_icon,
                    popup = ~popup,
                    group = 'Internas') %>% 
  leaflegend::addLegendAwesomeIcon(
    awesomeIconList(
      `Edições de rua` = a_icon,
      `Edições internas` = intern_icon,
      `Edição selecionada` = b_icon
    ),
    title = 'Legenda',
    position = 'bottomright'
  )

js_api <- readChar('../js/show_group_map.js',nchars = 5000)

m <- htmlwidgets::onRender(l, js_api)

m <- htmlwidgets::appendContent(m,tags$script(
  src = '../js/show_group_map.js'
))

m <- htmlwidgets::appendContent(m,tags$link(
  href = '../css/basemap.css',
  rel = "stylesheet"
))

htmlwidgets::saveWidget(m, "../basemap/map.html", selfcontained = FALSE)


