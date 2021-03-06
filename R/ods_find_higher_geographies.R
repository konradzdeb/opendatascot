#' Find all geographies that contain, a certain geography
#'
#' \code{ods_find_higher_geographies} returns a dataset from \href{https://statistics.gov.scot/}{statistics.gov.scot} of all geographies which contain the geography provided
#'
#' The \code{geography} parameter must be passed a valid geography unit.
#'
#' @param geography \code{string}. A valid geography unit from \href{https://statistics.gov.scot/}{statistics.gov.scot}.
#'
#' @return \code{tibble}.
#'
#' @examples
#' ods_find_higher_geographies("S02001257")
#'
#' @export

ods_find_higher_geographies <- function(geography) {
  
  endpoint <- "http://statistics.gov.scot/sparql"
  
  query <- paste0("
  PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
  
  SELECT distinct ?geography ?description
  WHERE {
    ?data <http://purl.org/linked-data/sdmx/2009/dimension#refArea> ?geographyURI.
    <http://statistics.gov.scot/id/statistical-geography/", geography, "> <http://publishmydata.com/def/ontology/foi/within> ?geographyURI.
    ?geographyURI <http://publishmydata.com/def/ontology/foi/memberOf> ?descriptionURI.
    ?descriptionURI rdfs:label ?description.
    ?geographyURI <http://publishmydata.com/def/ontology/foi/code> ?geography.
  }
  order by ?geography
")
  
  query_data <- SPARQL::SPARQL(endpoint, query)$results
  
  return(query_data)
  
}
