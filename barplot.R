#ch08/ 기본 그래프 작성하기

favorite=c('winter','summer','spring','summer','fall','fall','summer','spring','spring')

ds=table(favorite)

barplot(ds,
        main='favorite season',
        col='blue',
        xlab='계절',
        ylab='빈도수',
        horiz=TRUE,
        names=c('FA','SP','SU','WI'))

barplot(ds, main='foavorite season')
