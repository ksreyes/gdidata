% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/unhcr.R
\docType{data}
\name{unhcr}
\alias{unhcr}
\title{Forcibly Displaced Population}
\format{
An object of class \code{tbl_df} (inherits from \code{tbl}, \code{data.frame}) with 172642 rows and 5 columns.
}
\source{
United Nations High Commissioner for Refugees.
}
\usage{
unhcr
}
\description{
Count of forcibly displaced populations at yearend, as reported by UNHCR.
}
\details{
\describe{
\item{geo}{country, area, or territory of asylum (ISO-3)}
\item{t}{year}
\item{from}{origin of forcibly displaced persons (ISO-3)}
\item{group}{refugee, asylum, idp, other}
\item{n}{count}
}

Downloaded from
https://www.unhcr.org/refugee-statistics/download/?url=tzZ1du on 4
September 2024. Data was last updated 13 June 2024.

This dataset counts populations who are in need of international
protection, classified into four groups: refugees ("refugee"),
asylum-seekers ("asylum"), internally displaced persons ("idp"), and others
("other").

In compiling these statistics, UNHCR follows the \emph{International
Recommendations on Refugee Statistics} (2018), an internationally accepted
framework for statistics on refugee and refugee-related populations.

Only conflict-generated IDPs are compiled by UNHCR. See \code{idmc_stocks} for
displacements generated by both conflict and natural disasters.

Notes on country definitions:
\itemize{
\item Serbia and Kosovo are reported as one entity.
\item China, Hong Kong Special Administrative Region, and Macao
Special Administrative Region are reported as separate entities.
}
}
\keyword{datasets}
