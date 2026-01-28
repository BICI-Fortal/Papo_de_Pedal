rm(list = ls())
library(LDA)
library(rmarkdown)
library(googlesheets4)

wd()

config_gargle_sheets()

paths <- list.dirs(
  path = Sys.getenv('papo_pedal_project_path'),
  recursive = F
)


paths <- paths[str_detect(paths,'Edicao')]

nm <- sapply(paths, function(x){
  fread(paste0(x,'/description.txt'))$data
})

paths <- paste0(paths,'/result/') %>% setNames(nm)

lapply(paths, function(x){
  list(
    path = x,
    list = list.files(
      path = x,
      pattern = '.gsheet|.xlsx|.rds'
    ))
}) %>% View()


file_paths <- lapply(paths, function(x){
  files <- list.files(
    path = x,
    pattern = '.gsheet|.xlsx',
    full.names = T
  )
  if(length(files)==0){
    return(NULL)
  }
  if('gsheet' %in% tools::file_ext(files)){
    file <- files[tools::file_ext(files)=='gsheet']
    id <- shell(paste0(
      'type "',file,':user.drive.id"'
    ),intern = T)
    read_sheet(googledrive::as_id(id)) %>% 
      mutate_all(as.character) %>% 
      saveRDS(paste0(dirname(file),'/pesquisa_papo_pedal.rds'))
    return(paste0(dirname(file),'/pesquisa_papo_pedal.rds'))
  }else{
    read_excel(files[1]) %>% 
      saveRDS(paste0(dirname(files[1]),'/pesquisa_papo_pedal.rds'))
    return(paste0(dirname(files[1]),'/pesquisa_papo_pedal.rds'))
  }
})

nm <- unname(nm) %>% as.character()

for (i in 1:length(file_paths)) {
  
  dt <- as.POSIXct(as.character(nm[1]),format = '%Y%m%d')
  edicao <- paste0(
    'Edição ',
    sprintf('%02d',lubridate::day(dt)),'/',
    sprintf('%02d',lubridate::month(dt)),'/',
    lubridate::year(dt)
  ) 
  
  rmarkdown::render(
    input = 'relatorios_por_edicao.Rmd',
    params = list(file_path = file_paths[[i]],
                  title = edicao),
    output_dir = paste0('../edicoes/',nm[i],'/'),
    output_file = paste0(nm[i],'.html')
  ) %>% tryCatch(error = function(e){
    print(e)
    print(i)
    print('\n')
  })
}

# path <- paste0(Sys.getenv('papo_pedal_project_path'),
#                'Edicao 270325/result/pesquisa_papo_pedal.rds')
# edicao <- "Edição 27/03/2025"
# 
# rmarkdown::render(
#   input = 'relatorios_por_edicao.Rmd',
#   params = list(file_path = path,title = edicao),
#   output_dir = '../edicoes/20250327/',
#   output_file = '20250327.html'
# )

