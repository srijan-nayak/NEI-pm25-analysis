source("load_data.R")
source("create_plots_dir.R")

baltimore <- subset(NEI, fips == "24510")

baltimore_emissions <- with(baltimore, tapply(Emissions, year, sum))
year <- as.numeric(names(baltimore_emissions))

png(paste0(plots_dir, "yearly-baltimore-emissions.png"))

plot(year, baltimore_emissions, type = "l",
     main = "PM 2.5 emissions from 1999 to 2008 in Baltimore City, Maryland",
     xlab = "Year", ylab = "Total emissions (in tons)")
points(year, baltimore_emissions, pch = 20)

dev.off()
