#나무지도
library(treemap)
data("GNI2014")
head(GNI2014)
treemap(GNI2014,index=c('continent','iso3'),
        vSize='population',
        vColor='GNI',
        type='value',
        title='전세계 인구조사')
##ggplot
install.packages('ggplot2')
library(ggplot2)
head(iris)
ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width,color=Species))+ #1단계: 밑바닥
    geom_point()+ #2단계: 어떤 그래프를 그릴 것인가
    ggtitle('iris의 산점도')+ #3단계: 주변 테마
    labs(x='길이',y='너비')

ggplot(iris,aes(x=Petal.Length,fill=Species))+
    geom_histogram(alpha=0.3)

ggplot(iris,aes(x=Species,y=Petal.Length, fill=Species))+
    geom_violin()

ggplot(iris,aes(x=Species,y=Petal.Length, fill=Species))+
    geom_boxplot()

ggplot(iris,aes(x=Species,fill=Species))+
    geom_density()
    

#기본개념 위에 내가 하고 싶은 것을 차곡 차곡 단계별로 쌓기