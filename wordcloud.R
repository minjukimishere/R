fruit_cloud=read.csv(file.choose(),header = T,encoding='UTF-8')

head(fruit_cloud)

install.packages('wordcloud')
install.packages('RColorBrewer')

library(wordcloud)
library(RColorBrewer)

color=brewer.pal(8,'Dark2')

wordcloud(words=fruit_cloud$title,
           freq=fruit_cloud$count,
           colors=color,
           scale=c(3,0.1),
          min.freq = 1,
          max.words=105,
          random.order=F,
          rot.per=0.1,
          sale=c(3,0.1),
          )

install.packages('wordcloud2')
library(wordcloud2)

wordcloud2(fruit_cloud,
           size=0.3,
           shape='star',
           backgroundColor='black',
           color = 'random-light')
