
# r5r -----------------------------------------------------------------------------------------

# data prep
library(raster)

dem = raster::raster("r5r/LisboaIST_clip_r1.tif") 
plot(dem)
crs(dem)
res(dem) #10m

dem2 = projectRaster(dem, crs = 4326)
plot(dem2)
raster::writeRaster(dem2, "r5r/LisboaIST_wgs84.tif")

crs(dem2)
res(dem2)

#delete previous r1.tif file

#setup
options(java.parameters = '-Xmx8G') #memory max 8GB
options(java.home="C:/Program Files/Java/jdk-11.0.11/")
library(r5r)
library(sf)
library(stplanr)
library(dplyr)

r5r_lts2 = setup_r5(data_path = "r5r/", elevation = "TOBLER", overwrite = TRUE) #includes osm from june 2022

#jittered routes with r5r, selection of LTS 2 and 4

od_lisbon_jittered_500_points = line2df(od_lisbon_jittered_500)
od_lisbon_jittered_500_OR = od_lisbon_jittered_500_points[,c(1,2,3)]
names(od_lisbon_jittered_500_OR) = c("id", "lon", "lat")
od_lisbon_jittered_500_DE = od_lisbon_jittered_500_points[,c(1,4,5)]
names(od_lisbon_jittered_500_DE) = c("id", "lon", "lat")

od_lisbon_jittered_500_r5r = od_lisbon_jittered_500
od_lisbon_jittered_500_r5r$id = 1:nrow(od_lisbon_jittered_500_r5r)


routes2_jittered_500_lts2 = detailed_itineraries(
  r5r_lts2,
  origins = od_lisbon_jittered_500_OR,
  destinations = od_lisbon_jittered_500_DE,
  mode = "BICYCLE",
  fare_structure = NULL,
  max_fare = Inf,
  max_walk_time = Inf,
  max_bike_time = Inf,
  max_trip_duration = 180L, #in minutes
  bike_speed = 12,
  max_lts = 2, #1 - quietest, 4 - hardcore
  shortest_path = TRUE, #FALSE?
  all_to_all = FALSE,
  n_threads = Inf,
  verbose = FALSE,
  progress = TRUE,
  drop_geometry = FALSE,
  output_dir = NULL
)
routes2_jittered_500_lts2 = routes2_jittered_500_lts2 %>% mutate(id = as.integer(from_id)) %>%
  select(id, total_duration, total_distance, route) %>%
  left_join(od_lisbon_jittered_500_r5r %>% st_drop_geometry(), by="id")
routes2_jittered_500_lts2 = sf::st_as_sf(
  as.data.frame(sf::st_drop_geometry(routes2_jittered_500_lts2)),
  geometry = routes2_jittered_500_lts2$geometry
)

mapview::mapview(routes2_jittered_500_lts2) #not using Almirante Reis

rnet2_jittered_500_lts2 = overline(routes2_jittered_500_lts2, attrib = "Bike")

tmap::tm_shape(rnet2_jittered_500_lts2) +
  tmap::tm_lines(
    id = NULL,
    lwd = "Bike",
    scale = 15,
    col = "Bike",
    palette = cols4all::c4a(palette = "mako")
  )



# with Minetti algorythm

r5r_lts3 = setup_r5(data_path = "r5r_m/", elevation = "MINETTI", overwrite = TRUE) #includes osm from june 2022

#jittered routes with r5r, selection of LTS 2 and 4


routes3_jittered_500_lts2 = detailed_itineraries(
  r5r_lts3,
  origins= od_lisbon_jittered_500_OR,
  destinations = od_lisbon_jittered_500_DE,
  mode = "BICYCLE",
  fare_structure = NULL,
  max_fare = Inf,
  max_walk_time = Inf,
  max_bike_time = Inf,
  max_trip_duration = 180L, #in minutes
  bike_speed = 12,
  max_lts = 2, #1 - quietest, 4 - hardcore
  shortest_path = TRUE, #FALSE?
  all_to_all = FALSE,
  n_threads = Inf,
  verbose = FALSE,
  progress = TRUE,
  drop_geometry = FALSE,
  output_dir = NULL
)
routes3_jittered_500_lts2 = routes3_jittered_500_lts2 %>% mutate(id = as.integer(from_id)) %>%
  select(id, total_duration, total_distance, route) %>%
  left_join(od_lisbon_jittered_500_r5r %>% st_drop_geometry(), by="id")
routes3_jittered_500_lts2 = sf::st_as_sf(
  as.data.frame(sf::st_drop_geometry(routes3_jittered_500_lts2)),
  geometry = routes3_jittered_500_lts2$geometry
)

mapview::mapview(routes3_jittered_500_lts2) #not using Almirante Reis

rnet3_jittered_500_lts2 = overline(routes3_jittered_500_lts2, attrib = "Bike")

tmap::tm_shape(rnet3_jittered_500_lts2) +
  tmap::tm_lines(
    id = NULL,
    lwd = "Bike",
    scale = 15,
    col = "Bike",
    palette = cols4all::c4a(palette = "mako")
  )


#try minetti with lts3


routes3_jittered_500_lts3 = detailed_itineraries(
  r5r_lts3,
  origins= od_lisbon_jittered_500_OR,
  destinations = od_lisbon_jittered_500_DE,
  mode = "BICYCLE",
  fare_structure = NULL,
  max_fare = Inf,
  max_walk_time = Inf,
  max_bike_time = Inf,
  max_trip_duration = 180L, #in minutes
  bike_speed = 12,
  max_lts = 3, #1 - quietest, 4 - hardcore
  shortest_path = TRUE, #FALSE?
  all_to_all = FALSE,
  n_threads = Inf,
  verbose = FALSE,
  progress = TRUE,
  drop_geometry = FALSE,
  output_dir = NULL
)
routes3_jittered_500_lts3 = routes3_jittered_500_lts3 %>% mutate(id = as.integer(from_id)) %>%
  select(id, total_duration, total_distance, route) %>%
  left_join(od_lisbon_jittered_500_r5r %>% st_drop_geometry(), by="id")
routes3_jittered_500_lts3 = sf::st_as_sf(
  as.data.frame(sf::st_drop_geometry(routes3_jittered_500_lts3)),
  geometry = routes3_jittered_500_lts3$geometry
)

mapview::mapview(routes3_jittered_500_lts3) #not using Almirante Reis

rnet3_jittered_500_lts3 = overline(routes3_jittered_500_lts3, attrib = "Bike")

tmap::tm_shape(rnet3_jittered_500_lts3) +
  tmap::tm_lines(
    id = NULL,
    lwd = "Bike",
    scale = 15,
    col = "Bike",
    palette = cols4all::c4a(palette = "mako")
  )


# try with higher disagregation

routes3_jittered_200_lts2 = detailed_itineraries(
  r5r_lts3, #minetti
  origins = od_lisbon_jittered_200_OR,
  destinations = od_lisbon_jittered_200_DE,
  mode = "BICYCLE",
  fare_structure = NULL,
  max_fare = Inf,
  max_walk_time = Inf,
  max_bike_time = Inf,
  max_trip_duration = 180L, #in minutes
  bike_speed = 12,
  max_lts = 2, #1 - quietest, 4 - hardcore
  shortest_path = TRUE, #FALSE?
  all_to_all = FALSE,
  n_threads = Inf,
  verbose = FALSE,
  progress = TRUE,
  drop_geometry = FALSE,
  output_dir = NULL
)
routes3_jittered_200_lts2 = routes3_jittered_200_lts2 %>% mutate(id = as.integer(from_id)) %>%
  select(id, total_duration, total_distance, route) %>%
  left_join(od_lisbon_jittered_200_r5r %>% st_drop_geometry(), by="id")
routes3_jittered_200_lts2 = sf::st_as_sf(
  as.data.frame(sf::st_drop_geometry(routes3_jittered_200_lts2)),
  geometry = routes3_jittered_200_lts2$geometry
)

rnet3_jittered_200_lts2 = overline(routes3_jittered_200_lts2, attrib = "Bike")

tmap::tm_shape(rnet3_jittered_200_lts2) +
  tmap::tm_lines(
    id = NULL,
    lwd = "Bike",
    scale = 15,
    col = "Bike",
    palette = cols4all::c4a(palette = "mako")
  )




# write_rds(routes2_jittered_500_lts2, "routes2_jittered_500_lts2.Rds")
# write_rds(routes3_jittered_500_lts2, "routes2_jittered_500_lts2.Rds")

counters2_sf_joined = st_join(counters_sf_joined,
                             rnet2_jittered_500_lts2 %>% rename(Bikes_jittered_500_lts2_tobler = Bike),
                             join = sf::st_nearest_feature)
counters2_sf_joined = st_join(counters2_sf_joined,
                              rnet3_jittered_500_lts2 %>% rename(Bikes_jittered_500_lts2_minetti = Bike),
                              join = sf::st_nearest_feature)
counters2_sf_joined = st_join(counters2_sf_joined,
                              rnet3_jittered_500_lts3 %>% rename(Bikes_jittered_500_lts3_minetti = Bike),
                              join = sf::st_nearest_feature)
counters2_sf_joined = st_join(counters2_sf_joined,
                              rnet3_jittered_200_lts2 %>% rename(Bikes_jittered_200_lts2_minetti = Bike),
                              join = sf::st_nearest_feature)


results2 = tibble::tribble(
  ~`Jittering`, ~`Routing`, ~`Nrow`, ~`R-Squared`,
  "Unjittered", "quietest", nrow(od_lisbon_sf), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_unjittered_quietest),
  "Unjittered", "balanced", nrow(od_lisbon_sf), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_unjittered_balanced),
  "Unjittered", "fastest", nrow(od_lisbon_sf), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_unjittered_fastest),
  "Unjittered", "LTS2", nrow(od_lisbon_sf), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_unjittered_lts2),
  "Unjittered", "LTS4", nrow(od_lisbon_sf), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_unjittered_lts4),
  "Jittered, no disaggregation", "quietest", nrow(od_lisbon_jittered), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_quietest),
  "Jittered, no disaggregation", "balanced", nrow(od_lisbon_jittered), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_balanced),
  "Jittered, no disaggregation", "fastest", nrow(od_lisbon_jittered), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_fastest),
  "Jittered, 500 disaggregation", "quietest", nrow(od_lisbon_jittered_500), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_500_quietest),
  "Jittered, 500 disaggregation", "balanced", nrow(od_lisbon_jittered_500), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_500_balanced),
  "Jittered, 500 disaggregation", "fastest", nrow(od_lisbon_jittered_500), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_500_fastest),
  "Jittered, 500 disaggregation", "LTS2", nrow(od_lisbon_jittered_500), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_500_lts2),
  "Jittered, 500 disaggregation", "LTS4", nrow(od_lisbon_jittered_500), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_500_lts4),
  "Jittered, 500 disaggregation", "LTS2 tobler", nrow(od_lisbon_jittered_500), cor(counters2_sf_joined$SumCiclistas, counters2_sf_joined$Bikes_jittered_500_lts2_tobler),
  "Jittered, 500 disaggregation", "LTS2 minetti", nrow(od_lisbon_jittered_500), cor(counters2_sf_joined$SumCiclistas, counters2_sf_joined$Bikes_jittered_500_lts2_minetti),
  "Jittered, 500 disaggregation", "LTS3 minetti", nrow(od_lisbon_jittered_500), cor(counters2_sf_joined$SumCiclistas, counters2_sf_joined$Bikes_jittered_500_lts3_minetti),
  "Jittered, 500 disaggregation", "Google", nrow(od_lisbon_jittered_500), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_500_google),
  "Jittered, 200 disaggregation", "quietest", nrow(od_lisbon_jittered_200), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_200_quietest),
  "Jittered, 200 disaggregation", "LTS2", nrow(od_lisbon_jittered_200), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_200_lts2),
  "Jittered, 200 disaggregation", "LTS2 minetti", nrow(od_lisbon_jittered_200), cor(counters2_sf_joined$SumCiclistas, counters2_sf_joined$Bikes_jittered_200_lts2_minetti),
)
knitr::kable(results2, digits = 2, booktabs = TRUE, caption = "\\label{tableresults}Results showing counter/model fit for route networks generated from different routing and jittering parameters",
             linesep = c("", "", "","", "\\addlinespace","","", "\\addlinespace","", "", "","","", "\\addlinespace"))




saveRDS(routes2_jittered_500_lts2, "routes2_jittered_500_lts2.Rds")
saveRDS(routes3_jittered_500_lts2, "routes3_jittered_500_lts2.Rds")
saveRDS(routes3_jittered_200_lts2, "routes3_jittered_200_lts2.Rds")
