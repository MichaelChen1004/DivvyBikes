# title             :global.R
# description       :global.R for Shiny App
# author            :rsml1729
# create-date       :2014-10-25
# usage             :RStudio
# notes             :
####################


# Download and decompress zipped CSV file
zipfloader=function(zipfn, fn){
  temporaryFile <- tempfile()
  download.file(zipfn,destfile=temporaryFile, method="curl")
  cat("File downloaded: ", zipfn, "\n")
  unzip(temporaryFile)
  cat("File unzipped: ", fn, "\n")
  file.remove(temporaryFile)
  read.csv(fn)
}

# Data source: DivvyBikes 2013 Bikeshare Data
divvy_url = "https://www.divvybikes.com/assets/images/Divvy_Stations_Trips_2013.zip"
divvy_fn = "Divvy_Stations_Trips_2013/Divvy_Trips_2013.csv"

# Load data and do some processing
#divvy <- zipfloader(divvy_url, divvy_fn)
#divvy <- read.csv(divvy_fn, stringsAsFactors=F)
divvy$usertype <- as.factor(divvy$usertype)
divvy$gender <- as.factor(divvy$gender)

divvy <- divvy[divvy$usertype=="Subscriber",]
divvy <- divvy[!is.na(divvy$birthday),]
divvy$age <- 2013 - divvy$birthday
divvy$tripduration <- divvy$tripduration / 60
