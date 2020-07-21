library(dplyr)
library(ggplot2)

source("load_data.R")
source("create_plots_dir.R")

p <- NEI %>%
  filter(
    fips == "24510",
    # ON-ROAD gives all motor vehicle sources
    type == "ON-ROAD"
  ) %>%
  group_by(year) %>%
  summarise(total_emissions = sum(Emissions)) %>%
  ggplot(aes(x = year, y = total_emissions)) +
  geom_line(size = 2) +
  geom_point(size = 3) +
  labs(
    x = "Year", y = "Total emissions (in tons)",
    title = "PM 2.5 emissions from motor vehicles in Baltimore from 1999 to 2008")

png(paste0(plots_dir, "baltimore-vehicle-emissions.png"))
# print the plot to the open device
print(p)
dev.off()
