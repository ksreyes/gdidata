% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wdi.R
\docType{data}
\name{wdi}
\alias{wdi}
\title{Various Country-Level Indicators}
\format{
An object of class \code{tbl_df} (inherits from \code{tbl}, \code{data.frame}) with 92435 rows and 4 columns.
}
\source{
World Bank; UN World Population Prospect
}
\usage{
wdi
}
\description{
A collection of annual country-level indicators from the World Bank World
Development Indicators, supplemented with population data from the UN World
Population Prospects
}
\details{
\describe{
\item{t}{year}
\item{geo}{country, area or territory (ISO-3)}
\item{var}{indicator}
\item{v}{value}
}

The following is the list of indicators, their definitions, and
their sources:
\itemize{
\item \strong{Birth rate} (\code{birth}): number of live births occurring during
the year per 1000 population estimated at midyear
(https://data.worldbank.org/indicator/SP.DYN.CBRT.IN)
\item \strong{Age dependency ratio} (\code{depend}): number of dependents (younger
than 15 or older than 64) per 100 working-age persons (aged 15-64)
(https://data.worldbank.org/indicator/SP.POP.DPND).
\item \strong{Foreign direct investment net inflows} (\code{fdiin}): direct
investment equity net inflows in current U.S. dollars
(https://data.worldbank.org/indicator/BX.KLT.DINV.CD.WD).
\item \strong{Foreign direct investment net outflows} (\code{fdiout}): direct
investment equity net outflows in current U.S. dollars
(https://data.worldbank.org/indicator/BM.KLT.DINV.CD.WD).
\item \strong{GDP, current $} (\code{gdp}): sum of gross value added by all
resident producers in the economy plus any product taxes minus any
subsidies not included in the value of products, in current U.S.
dollars (https://data.worldbank.org/indicator/NY.GDP.MKTP.CD).
\item \strong{GDP per capita, PPP constant 2021 international $} (\code{income}):
gross domestic product per capita converted to international dollars
using purchasing power parity rates
(https://data.worldbank.org/indicator/NY.GDP.PCAP.PP.KD).
\item \strong{Inflation rate} (\code{inf}): annual percentage change in the cost to
the average consumer of acquiring a basket of goods and services
(https://data.worldbank.org/indicator/FP.CPI.TOTL.ZG).
\item \strong{Net migration} (\code{nmig}): number of immigrants minus number of
emigrants, including both citizens and noncitizens
(https://data.worldbank.org/indicator/SM.POP.NETM).
\item \strong{Political Stability and Absence of Violence/Terrorism}
(\code{polstb}): measures perceptions of the likelihood of political
instability and/or politically-motivated violence, including terrorism,
expressed in standard deviations from the mean
(https://www.worldbank.org/en/publication/worldwide-governance-
indicators; last updated 29 Sep 2023).
\item \strong{Population} (\code{pop}): midyear count of all residents regardless
of legal status or citizenship from the UN World Population Prospect
2024 update
(https://www.un.org/development/desa/pd/content/international-migrant-stock)
\item \strong{Personal remittances received} (\code{remin}): comprise personal
transfers and compensation of employees in cash or in kind from
nonresident households to resident households in current U.S. dollars
(https://data.worldbank.org/indicator/BX.TRF.PWKR.CD.DT).
\item \strong{Personal remittances paid} (\code{remout}): comprise personal
transfers and compensation of employees in cash or in kind from
resident households to nonresident households in current U.S. dollars
(https://data.worldbank.org/indicator/BM.TRF.PWKR.CD.DT).
\item \strong{Unemployment rate} (\code{unem}): share of labor force that is
without work but available for and seeking employment
(https://data.worldbank.org/indicator/SL.UEM.TOTL.ZS).
}
}
\keyword{datasets}
