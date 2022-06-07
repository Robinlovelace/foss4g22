Jittering: a flexible approach for converting OD data into geographic
desire lines, routes and route networks for transport planning
================
Robin Lovelace, Rosa Félix, Dustin Carlino

<!-- README.md is generated from README.Rmd. Please edit that file -->

# Introduction

Origin-destination (OD) datasets provide information on aggregate travel
patterns between zones and geographic entities. OD datasets are
‘implicitly geographic’, containing identification codes of the
geographic objects from which trips start and end. A common approach to
converting OD datasets to geographic entities, for example represented
using the simple features standard (Open Geospatial Consortium Inc 2011)
and saved in file formats such as GeoPackage and GeoJSON, is to
represent each OD record as a straight line between zone centroids. This
approach to representing OD datasets on the map has been since at least
the 1950s (Boyce and Williams 2015) and is still in use today (e.g. Rae
2009).

Beyond simply visualising aggregate travel patterns, centroid-based
geographic desire lines are also used as the basis of many transport
modelling processes. The following steps can be used to convert OD
datasets into route networks, in a process that can generate nationally
scalable results (Morgan and Lovelace 2020):

-   OD data converted into centroid-based geographic desire lines

-   Calculation of routes for each desire line, with start and end
    points at zone centroids

-   Aggregation of routes into route networks, with values on each
    segment representing the total amount of travel (‘flow’) on that
    part of the network, using functions such as `overline()` in the
    open source R package `stplanr` (Lovelace and Ellison 2018)

This approach is tried and tested. The OD -\> desire line -\> route -\>
route network processing pipeline forms the basis of the route network
results in the Propensity to Cycle Tool, an open source and publicly
available map-based web application for informing strategic cycle
network investment, ‘visioning’ and prioritisation (Lovelace et al.
2017; Goodman et al. 2019). However, the approach has some key
limitations:

-   Flows are concentrated on transport network segments leading to zone
    centroids, creating distortions in the results and preventing the
    simulation of the diffuse networks that are particularly important
    for walking and cycling

-   The results are highly dependent on the size and shape of geographic
    zones used to define OD data

-   The approach is inflexible, providing few options to people who want
    to use valuable OD datasets in different ways

To overcome these limitations we developed a ‘jittering’ approach to
conversion of OD datasets to desire lines that randomly samples points
within each zone (Lovelace, Félix, and Carlino 2022). While that paper
discussed the conceptual development of the approach, it omitted key
details on its implementation in open source software.

In this paper we outline the implementation of jittering and demonstrate
how a single Rust crate can provide the basis of implementations in
other languages. Furthermore, we demonstrate how jittering can be used
to create more diffuse and accurate estimates of movement at the level
of segments (‘flows’) on transport network, in reproducible code-driven
workflows and with minimal computational overheads compared with the
computationally intensive process of route calculation (‘routing’) or
processing large GPS datasets. The overall aim is to describe the
jittering approach in technical terms and its implementation in open
source software.

Before describing the approach, some definitions are in order:

-   **Origins**: locations of trip departure, typically stored as ID
    codes linking to zones

-   **Destinations**: trip destinations, also stored as ID codes linking
    to zones

-   **Attributes**: the number of trips made between each ‘OD pair’ and
    additional attributes such as route distance between each OD pair

-   **Jittering**: The combined process of ‘splitting’ OD pairs
    representing many trips into multiple ‘sub OD’ pairs
    (disaggregation) and assigning origins and destinations to multiple
    unique points within each zone

# Approach

Jittering represents a comparatively simple — compared with ‘connector’
based methods (Jafari et al. 2015) — approach is to OD data
preprocessing. For each OD pair, the jittering approach consists of the
following steps for each OD pair (provided it has required inputs of a
disaggregation threshold, a single number greater than one, and
sub-points from which origin and destination points are located):

1.  Checks if the number of trips (for a given ‘disaggregation key’,
    e.g. ‘walking’) is greater than the disaggregation threshold.
2.  If so, the OD pair is disaggregated. This means being divided into
    as many pieces (‘sub-OD pairs’) as is needed, with trip counts
    divided by the number of sub-OD pairs, for the total to be below the
    disaggregation threshold.
3.  For each sub-OD pair (or each original OD pair if no disaggregation
    took place) origin and destination locations are randomly sampled
    from sub-points which optionally have weights representing relative
    probability of trips starting and ending there.

This approach has been implemented efficiently in the Rust crate
`odjitter`, the source code of which can be found at
<https://github.com/dabreegster/odjitter>.

# Results

We have found that jittering leads to more spatially diffuse
representations of OD datasets than the common approach to desire lines
that go from and to zone centroids. We have used the approach to add
value to numerous OD datasets for projects based in Ireland, Norway,
Portugal, New Zealand and beyond. For instance, Fig. shows the
difference between desire lines with centroids approach and the
jittering approach.

<img src="README_files/figure-gfm/jitteredoverview-1.png" title="\label{poltlisbon}Trips represented with desire lines from centroids and with jittering, for Lisbon (Portugal)" alt="\label{poltlisbon}Trips represented with desire lines from centroids and with jittering, for Lisbon (Portugal)" width="50%" style="display: block; margin: auto;" /><img src="README_files/figure-gfm/jitteredoverview-2.png" title="\label{poltlisbon}Trips represented with desire lines from centroids and with jittering, for Lisbon (Portugal)" alt="\label{poltlisbon}Trips represented with desire lines from centroids and with jittering, for Lisbon (Portugal)" width="50%" style="display: block; margin: auto;" />

Although useful for visualising the complex and spatially diffuse
reality of travel patterns, we found that the most valuable use of
jittering is as a pre-processing stage before routing and route network
generation. Route networks generated from jittered desire lines are more
diffuse, and potentially more realistic, that centroid-based desire
lines.

We also found that the approach, implemented in Rust and with bindings
to R and Python (in progress), is fast. Benchmarks show that the
approach can ‘jitter’ desire lines representing millions of trips in a
major city in less than a minute on consumer hardware.

We also found that the results of jittering depend on the geographic
input datasets representing start points and trip attractors, and the
use of weights. This highlights the importance of exploring the
parameter space for optimal jittered desire line creation.

# Next steps

We plan to create/improve R/Python interfaces to the `odjitter` and
enable others to benefit from it.
<!-- Although an R interface to the `odjitter` crate has already been developed, it uses system calls, not bindings provided by the R package `rextendr`. -->
We plan to improve the package’s documentation and to test its results,
supporting reproducible sustainable transport research worldwide.

# References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-boyce_forecasting_2015" class="csl-entry">

Boyce, David E., and Huw C. W. L. Williams. 2015. *Forecasting Urban
Travel: Past, Present and Future*. Edward Elgar Publishing.

</div>

<div id="ref-goodman_scenarios_2019" class="csl-entry">

Goodman, Anna, Ilan Fridman Rojas, James Woodcock, Rachel Aldred,
Nikolai Berkoff, Malcolm Morgan, Ali Abbas, and Robin Lovelace. 2019.
“Scenarios of Cycling to School in England, and Associated Health and
Carbon Impacts: Application of the ‘Propensity to Cycle Tool’.” *Journal
of Transport & Health* 12 (March): 263–78.
<https://doi.org/10.1016/j.jth.2019.01.008>.

</div>

<div id="ref-jafari_investigation_2015" class="csl-entry">

Jafari, Ehsan, Mason D. Gemar, Natalia Ruiz Juri, and Jennifer Duthie.
2015. “Investigation of Centroid Connector Placement for Advanced
Traffic Assignment Models with Added Network Detail.” *Transportation
Research Record: Journal of the Transportation Research Board* 2498
(June): 19–26. <https://doi.org/10.3141/2498-03>.

</div>

<div id="ref-lovelace_stplanr_2018" class="csl-entry">

Lovelace, Robin, and Richard Ellison. 2018. “Stplanr: A Package for
Transport Planning.” *The R Journal* 10 (2): 7–23.
<https://doi.org/10.32614/RJ-2018-053>.

</div>

<div id="ref-Lovelace2022Jittering" class="csl-entry">

Lovelace, Robin, Rosa Félix, and Dustin Carlino. 2022. “Jittering: A
Computationally Efficient Method for Generating Realistic Route Networks
from Origin-Destination Data.” *Findings*, April.
<https://doi.org/10.32866/001c.33873>.

</div>

<div id="ref-lovelace_propensity_2017" class="csl-entry">

Lovelace, Robin, Anna Goodman, Rachel Aldred, Nikolai Berkoff, Ali
Abbas, and James Woodcock. 2017. “The Propensity to Cycle Tool: An Open
Source Online System for Sustainable Transport Planning.” *Journal of
Transport and Land Use* 10 (1). <https://doi.org/10.5198/jtlu.2016.862>.

</div>

<div id="ref-morgan_travel_2020" class="csl-entry">

Morgan, Malcolm, and Robin Lovelace. 2020. “Travel Flow Aggregation:
Nationally Scalable Methods for Interactive and Online Visualisation of
Transport Behaviour at the Road Network Level.” *Environment & Planning
B: Planning & Design*, July. <https://doi.org/10.1177/2399808320942779>.

</div>

<div id="ref-ogcopengeospatialconsortiuminc_opengis_2011"
class="csl-entry">

Open Geospatial Consortium Inc, (OGC). 2011. “OpenGIS Implementation
Specification for Geographic Information - Simple Feature Access - Part
1: Common Architecture.” OGC 06-103r4. (OGC) Open Geospatial Consortium
Inc. <https://www.ogc.org/standards/sfa>.

</div>

<div id="ref-rae_spatial_2009" class="csl-entry">

Rae, Alasdair. 2009. “From Spatial Interaction Data to Spatial
Interaction Information? Geovisualisation and Spatial Structures of
Migration from the 2001 UK Census.” *Computers, Environment and Urban
Systems* 33 (3): 161–78.
<https://doi.org/10.1016/j.compenvurbsys.2009.01.007>.

</div>

</div>
