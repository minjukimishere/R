library(readxl)

forest_example_data=read_excel("C:/Rstudy/forest_example_data.xls")

colnames(forest_example_data)=c("name","city","gubun","area",
                                "number","stay","city_new",
                                "code","codename")
str(forest_example_data)
head(forest_example_data)

library(descr)
freq(forest_example_data$city,plot=T,main='city')
forest_example_data$city

city_table=table(forest_example_data$city)
city_table
barplot(city_table)

library(dplyr)
count(forest_example_data,city) %>% arrange(desc(n))

count (forest_example_data,city_new)%>%arrange(desc(n))

freq(forest_example_data$gubun,plot=T,main='휴양림 구분')
