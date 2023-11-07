#데이터 입출력1
#--------------------------------------------
#나이를 입력하여 최고 나이, 최저 나이 계산
#-------------------------------------------
#입력-처리-출력
#--------------

age=c(28,17,35,46,23,67,30,50) #입력

old=max(age) #정보처리
sort(age,decreasing=T)
young=min(age)
sum(age)
mean(age)

print() #출력: 가장 젊은 나이는..., 가장 나이든...
cat('어린나이:',young,'\t','가장 나이든 나이:',old)

#----------------
#데이터 입출력2
#------------------------------------
#사용자가 소득을 입력하면 세금계산
#------------------------------------

install.packages('svDialogs')
library(svDialogs)

#입력
user.input=dlgInput("소득을 입력")$res
user.input

#처리
income=as.numeric(user.input)
tax=income*0.05

#출력
cat('소득:',user.input,'세금:',tax)

#----------------체질량 지수 계산하기.
user.height=dlgInput("키 입력")$res
user.weight=dlgInput("몸무게 입력")$res
height=as.numeric(user.height)*0.01
weight=as.numeric(user.weight)
bmi=weight/(height^2)
#---# 조건문
if(bmi>=30){
    index='비만'
}else if(bmi>=25){
    index='과체중'
}else{
    index='정상'
}
cat('키는',user.height,'몸무게는',user.weight,'bmi는',bmi,'\t',index,'입니다.')

