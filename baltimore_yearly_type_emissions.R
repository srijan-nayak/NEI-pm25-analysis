library(dplyr)
library(ggplot2)

source("load_data.R")
source("create_plots_dir.R")

png(paste0(plots_dir, "yearly-type-baltimore-emissions.png"))

p <- NEI %>%
  filter(fips == "24510") %>%
  mutate(year = as.numeric(year)) %>%
  group_by(year, type) %>%
  summarise(total_emissions = sum(Emissions)) %>%
  ggplot(aes(x = year, y = total_emissions, color = type)) +
  geom_line(size = 2) +
  geom_point(size = 3) +
  labs(title = "PM 2.5 emissions from 1999 to 2008 in Baltimore City, Maryland",
       x = "Year", y = "Total emissions (in tons)")
# print the plot to the open device
print(p)

dev.off()
