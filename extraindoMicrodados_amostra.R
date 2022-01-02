###########################################################
#### EXTRACTING INFO FROM BRAZILIAN CENSUS - MICRODATA ####
###########################################################

# Local

getwd()
setwd("C:/Users/rassi/Desktop")

# Library

library(readr)
library(dplyr)
library("xlsx")

# Dictionary

dicionario_domi<-fwf_positions(
  start=c(3,8,58,74,75,80,85,82),
  end=c(7,20,58,74,76,81,85,84),
  col_names=c('V0002',
              'V0011',
              'V0201',
              'V0202', 
              'V0203',
              'V0204',
              'V0205',
              'V6204'))

# Loading data from households from Metropolitan Region of São Paulo

domi_rmsp <-read_fwf(file='Amostra_Domicilios_35_RMSP.txt',
                   col_positions=dicionario_domi)

# Filtering only households from Taboão da Serra

domi_Taboao <- domi_rmsp %>% filter(V0002 == "52809")

# Writing data in a xlsx file

write.xlsx(as.data.frame(domi_Taboao), file = "domi_Taboao.xlsx", col.names = TRUE)
