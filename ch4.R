
#2023.9.27 ch4 벡터 다루기
#확인문제
v1=c(6,1,3,7,9)
v2=c(9,1,0,3,7)

v3=v1+v2

v1+v2
v,1*v2
v2-3
3*v1-v2
v2+c(1,2,-1,3,5)

a=seq(from=20,to=80,by=7)
#1
length(a)
sort(a,decreasing=T)
max(a)
min(a)
mean(a)
median(a)
var(a)
sd(a)

sort(a,T)

range(a)



#LAB.R 카페분석 (벡,터이용)
espresso=c(4,5,3,6,5,4,7)
americano=c(63,68,64,68,72,89,94)
cafelatte=c(61,70,59,71,71,98,88)
day=c('mon','tue','wed','thu','fri','sat','sun')
sales.es=espresso*2.0
sales.es
sales.am=americano*2.5
sales.am
sales.ca=cafelatte*3.0
sales.ca

sa.day=sales.es+sales.am+sales.ca
sa.day
sum(sa.day) #총매출액
mean(sa.day) #평균 매출액

names(sa.day)=day
sa.day #요일별매출액

sum(sa.day)

sale.mean=mean(sa.day)
sa.day>=sale.mean
sa.day[sa.day>=sale.mean] #평균 이상인 요일

#5 매출이 높은 요일 힌트:max,sort,names
sale.max=sort(sa.day,decreasing=T)
sale.max[1]

sale#팩터 확인문제
a=c('red','white','brown','green','white','red','brown','white')

f.color=factor(a)
levels(f.color)
as.integer(f.color)

#확인문제:리스트
oneday_class=list(class='sun_catcher',
                  day=c('Tue','Wed','Sat'),
                  price=60000,
                  parking=T)
oneday_class

oneday_class[[2]]
oneday_class$day
oneday_class$price

#LAB. R 카페의 매출액 분석하기 2 :팩터와 리스트
#메뉴 리스트(메뉴판 포함)
cafe=list(espresso=c(4,5,3,6,5,4,7),
          americano=c(63,68,64,68,72,89,94),
          latte=c(61,70,59,71,71,92,88),
          price=c(2.0,2.5,3.0),
          menu=c('espresso','americano','latte'))

#메뉴판 
cafe$menu=factor(cafe$menu)
names(cafe$price)=cafe$menu

#금액에 따른 메뉴의 매출액
sale.espresso=cafe$price['espresso']*cafe$espresso
sale.americano=cafe$price['americano']*cafe$americano
sale.latte=cafe$price['latte']*cafe$latte
