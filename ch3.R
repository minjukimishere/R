#2023.9.13

total=5050

total
print(total)
cat('합계:',total) #concatenate 사슬처럼 잇다

name='김민주'
name

age=20
age

cat('이름=',name,'나이=',age*2,'입니다')


year_born=1998
current_year=2023
age=current_year-year_born
age


#LAB

salt=50
water=100
result=50/(50+100)*100
result
result
cat("소금=",salt,"물=",water,"농도=",result,"%")

install.packages(c("dplyr","hflights"))
library(dplyr)
library(hflights)

dim(hflights)
hflights_df=tbl_df(hflights)

