library(dplyr)
library(ggplot2)

source("load_data.R")
source("create_plots_dir.R")

# get coal related source classification codes
coal_related <- grepl("[Cc]oal", SCC$Short.Name)
coal_scc <- SCC %>% filter(coal_related)
coal_related_codes <- coal_scc$SCC

p <- NEI %>%
  filter(SCC %in% coal_related_codes) %>%
  group_by(year) %>%
  summarise(total_emissions = sum(Emissions)) %>%
  ggplot(aes(x = year, y = total_emissions)) +
  geom_line(size = 2) +
  geom_point(size = 3) +
  labs(x = "Year", y = "Total emissions (in tons)",
       title = "Coal related PM 2.5 emissions from 1999 to 2008")

png(paste0(plots_dir, "yearly-coal-emissions.png"))
# print the plot to the open device
print(p)
dev.off()
