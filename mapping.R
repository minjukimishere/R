install.packages("ggplot2")
install.packages("ggmap")
install.packages("rvest") #웹크롤링

library(ggplot2)
library(ggmap)
library(rvest)

register_google(key="구글API키")

html.airports <- read_html("https://en.wikipedia.org/wiki/List_of_busiest_airports_by_passenger_traffic")

df <- html_table(html_nodes(html.airports, "table")[[1]], fill = TRUE) 

head(df)

colnames(df)[6] <- 'total'
df$total <- gsub('\\[[0-9]+\\]', '', df$total)
df$total <- gsub(',', '', df$total)
df$total <- as.numeric(df$total)

gc <- geocode(df$Airport)
df <- cbind(df, gc)
world <- map_data('world')

ggplot(df, aes(x=lon, y=lat)) +
    geom_polygon(data=world, aes(x=long, y=lat, group=group), fill='grey75', color='grey70') + 
    geom_point(color='dark red', alpha=.25, aes(size=total)) + 
    geom_point(color='dark red', alpha=.75, shape=1, aes(size=total)) + 
    theme(legend.position='none')