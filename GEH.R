results2 = tibble::tribble(
  ~`Jittering`, ~`Routing`, ~`Nrow`, ~`R-Squared`, ~`GEH`,
  "Unjittered", "quietest", nrow(od_lisbon_sf), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_unjittered_quietest), mean(sqrt((counters_sf_joined$Bikes_unjittered_quietest-counters_sf_joined$SumCiclistas)^2/(0.5*(counters_sf_joined$Bikes_unjittered_quietest+counters_sf_joined$SumCiclistas)))),
  "Unjittered", "balanced", nrow(od_lisbon_sf), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_unjittered_balanced),
  "Unjittered", "fastest", nrow(od_lisbon_sf), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_unjittered_fastest),
  "Unjittered", "LTS2", nrow(od_lisbon_sf), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_unjittered_lts2),mean(sqrt((counters_sf_joined$Bikes_unjittered_lts2-counters_sf_joined$SumCiclistas)^2/(0.5*(counters_sf_joined$Bikes_unjittered_lts2+counters_sf_joined$SumCiclistas)))),
  "Unjittered", "LTS4", nrow(od_lisbon_sf), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_unjittered_lts4),
  "Jittered, no disaggregation", "quietest", nrow(od_lisbon_jittered), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_quietest),
  "Jittered, no disaggregation", "balanced", nrow(od_lisbon_jittered), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_balanced),
  "Jittered, no disaggregation", "fastest", nrow(od_lisbon_jittered), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_fastest),
  "Jittered, 500 disaggregation", "quietest", nrow(od_lisbon_jittered_500), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_500_quietest),
  "Jittered, 500 disaggregation", "balanced", nrow(od_lisbon_jittered_500), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_500_balanced),
  "Jittered, 500 disaggregation", "fastest", nrow(od_lisbon_jittered_500), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_500_fastest),
  "Jittered, 500 disaggregation", "LTS2", nrow(od_lisbon_jittered_500), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_500_lts2),
  "Jittered, 500 disaggregation", "LTS4", nrow(od_lisbon_jittered_500), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_500_lts4),
  "Jittered, 500 disaggregation", "Google", nrow(od_lisbon_jittered_500), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_500_google),
  "Jittered, 200 disaggregation", "quietest", nrow(od_lisbon_jittered_200), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_200_quietest),
  "Jittered, 200 disaggregation", "LTS2", nrow(od_lisbon_jittered_200), cor(counters_sf_joined$SumCiclistas, counters_sf_joined$Bikes_jittered_200_lts2),
)
knitr::kable(results2, digits = 2, booktabs = TRUE, caption = "\\label{tableresults}Results showing counter/model fit for route networks generated from different routing and jittering parameters",
             linesep = c("", "", "","", "\\addlinespace","","", "\\addlinespace","", "", "","","", "\\addlinespace"))

sqrt((counters_sf_joined$Bikes_unjittered_lts2-counters_sf_joined$SumCiclistas)^2/(0.5*(counters_sf_joined$Bikes_unjittered_lts2+counters_sf_joined$SumCiclistas)))
1/(1+sqrt((counters_sf_joined$Bikes_unjittered_lts2-counters_sf_joined$SumCiclistas)^2/((10000*counters_sf_joined$SumCiclistas))))

mean(sqrt((counters_sf_joined$Bikes_unjittered_lts2-counters_sf_joined$SumCiclistas)^2/(0.5*(counters_sf_joined$Bikes_unjittered_lts2+counters_sf_joined$SumCiclistas))))
mean(1/(1+sqrt((counters_sf_joined$Bikes_unjittered_lts2-counters_sf_joined$SumCiclistas)^2/((10000*counters_sf_joined$SumCiclistas)))))
