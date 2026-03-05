rm(list = ls())
system(
  paste0('Rscript "',
         normalizePath('gerador_relatorio.R'),
         '"')
)
rm(list = ls())
source('home.R')

rm(list = ls())
source('mapa_edicoes.R')

rm(list = ls())
