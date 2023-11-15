#chapter 06. 데이터 입력하고 출력하기
#1.데이터의 입력과 출력은 어떻게 하는 것일까?
#2. 파일을 이용해 데이터를 읽고 쓰는 방법 알아보기
#3. 파일 입출력에서 알아야 할 내용 확인하기.

# ggplot2 패키지를 로드합니다.
library(ggplot2)
library(dplyr)

# diamonds 데이터셋을 불러옵니다.
data("diamonds")

# Premium 커팅 품질이며 무게가 2캐럿 이상인 데이터를 추출합니다.
selected_data <- diamonds %>% 
    filter(cut == "Premium" & carat >= 2)

# 추출한 데이터를 csv 파일로 저장합니다.
write.csv(selected_data, "premium_diamonds.csv", row.names = FALSE)

# 저장된 파일 경로를 출력합니다.
current_directory <- getwd()
print(paste("현재 작업 디렉토리:", current_directory))
