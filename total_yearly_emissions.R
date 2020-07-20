source("load_data.R")
source("create_plots_dir.R")

total_emissions <- with(NEI, tapply(Emissions, year, sum))
year <- as.numeric(names(total_emissions))

png(paste0(plots_dir, "yearly-total-emissions.png"))

plot(year, total_emissions, type = "l",
     main = "Total PM 2.5 emissions from 1999 to 2008",
     xlab = "Year", ylab = "Total emissions (in tons)")
points(year, total_emissions, pch = 20)

dev.off()
