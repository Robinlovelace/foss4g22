#plot map with baseline
library(dplyr)
library(sf)
library(biclar)

# MUNICIPIOSgeo = readRDS(url("https://github.com/U-Shift/biclar/releases/download/0.0.1/MUNICIPIOSgeo.Rds"))
# MUNICIPIOS = MUNICIPIOSgeo$Concelho
# 
# REDEregion = readRDS("rnet_enmac_quietest_full.Rds") #quiet
# # REDEregion = readRDS("rnet_enmac_fastest_full.Rds") #fast
# 
# scenario = "baseline" #baseline, enmac4, enmac10
# route = "quiet" #quiet, fast
# 
# mun = MUNICIPIOS[6] #test with Lisbon 6
# BUFFER = MUNICIPIOSgeo %>% filter(Concelho == mun) %>% st_buffer(100) #maybe reduce to 200? 
# REDE = REDEregion %>% st_filter(BUFFER)
# REDE = REDE %>% filter(ENMAC10 >= quantile(REDE$ENMAC10, 0.60)) #0.6 for quiet, 0.7 for fast, change here scenario. (Barreiro should be 0.65)

REDE = st_read("Lisbon_quiet_500_top40pp.gpkg")

prioritysegments = st_read("Lisbon_prioritize_baseline.gpkg")
prioritysegments_buffer = st_buffer(prioritysegments, dist = 400, joinStyle = "BEVEL", endCapStyle = "SQUARE") %>% st_union()

tmap_options(check.and.fix = TRUE)
tm_shape(REDE) +
  tmap::tm_lines(
    id = NULL,
    lwd = "Baseline",
    scale = 15,
    col = "Quietness",
    palette = cols4all::c4a(palette = "-mako")
  )+
  tm_shape(prioritysegments_buffer) +
  tm_polygons(alpha = 0,
              border.col = "red",
              col = NA,
              border.lwd = 1.5)
