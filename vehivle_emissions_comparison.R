library(dplyr)
library(ggplot2)

source("load_data.R")
source("create_plots_dir.R")

p <- NEI %>%
  filter(
    fips == "24510" | fips == "06037",
    # ON-ROAD gives all motor vehicle sources
    type == "ON-ROAD"
  ) %>%
  group_by(year, fips) %>%
  summarise(total_emissions = sum(Emissions)) %>%
  mutate(city = ifelse(fips == "24510",
                       "Baltimore City", "Los Angeles County")) %>%
  ggplot(aes(x = year, y = total_emissions, color = city)) +
  geom_line(size = 2) +
  geom_point(size = 3) +
  # plot on a logarithmic y-scale to compare drastic changes
  scale_y_log10() +
  labs(
    x = "Year", y = "Total emissions (in tons)",
    title = "PM 2.5 emissions from motor vehicles in Baltimore and Los Angeles")

png(paste0(plots_dir, "vehicle-emissions-comparison.png"))
# print the plot to the open device
print(p)
dev.off()
