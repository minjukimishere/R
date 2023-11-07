#------------------------
# 전처리: 데이터를 알맞게 다듬기
#-----------------------

#불필요한 정보 지우기

#--#1단계 수집한 데이터 불러오기
#아파트 실거래 자료 불러오기

setwd(dirname(rstudioapi::getSourceEditorContext()$path)) #작업폴더 설정
options(warn=-1) #전처리 과정 경고 메세지 무시

load("./03_integrated/03_apt_price.rdata") #실거래 자료 불러오기
head(apt_price,2) #자료 확인

#결측값과 공백 제거하기
#결측값 확인
table(is.na(apt_price)) #NA not available 로 표현하기-> TRUE 가 결측값

#결측값 제거 후 확인
apt_price=na.omit(apt_price) #결측값 제거
table(is.na(apt_price))

#공백 확인
head(apt_price$price,2) #매매가 확인

# 공백 제거와 확인
install.packages("stringr")#문자열 처리 패키지지