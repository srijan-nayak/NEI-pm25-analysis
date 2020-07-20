data_dir <- "data/"

# create a data directory if it doesn't exist
if (!dir.exists(data_dir)) {
  dir.create(data_dir)
}

download_unzip_data <- function() {
  zip_url <-
    "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  zip_path <- paste0(data_dir, "NEI_data.zip")

  # download and unzip the data zip file
  download.file(zip_url, destfile = zip_path)
  unzip(zip_path, exdir = data_dir)
}

load_data <- function() {
  emissions_file <- paste0(data_dir, "summarySCC_PM25.rds")
  scc_file <- paste0(data_dir, "Source_Classification_Code.rds")

  # check if the required data files are in the data directory
  if (!(file.exists(emissions_file) & file.exists(scc_file))) {
    download_unzip_data()
  }

  # load the data into global environment
  NEI <<- readRDS(emissions_file)
  SCC <<- readRDS(scc_file)
}

# check if NEI and SCC are in global environment
if (!("NEI" %in% ls() & "SCC" %in% ls())) {
  load_data()
}
