install.packages("KoNLP")
library(KoNLP)
useNIADic()

# 1. 네이버 뉴스 url 분리 (키워드+기간+페이지 수)
## 전체 url: https://search.naver.com/search.naver?where=news&sm=tab_pge&query=%ED%95%B4%EC%96%91%ED%99%98%EA%B2%BD&sort=0&photo=0&field=0&pd=3&ds=2023.08.10&de=2023.10.10&cluster_rank=34&mynews=0&office_type=0&office_section_code=0&news_office_checked=&office_category=0&service_area=0&nso=so:r,p:from20230810to20231010,a:all&start=1

url1='https://search.naver.com/search.naver?where=news&sm=tab_pge&query='
keyword='해양환경' ##원하는 키워드 입력
url2='&sort=0&photo=0&field=0&pd=3&'
start_date='ds=2023.08.010&' #원하는 시작 날짜
end_date='de=2023.10.10&' #원하는 종료 날짜
url3='&cluster_rank=34&mynews=0&office_type=0&office_section_code=0&news_office_checked=&office_category=0&service_area=0&nso=so:r,p:from20230810to20231010,a:all&start=1'
PAGE=seq(from=1,by=10,length.out=50) ##length.out=원하는 페이지 수 입력


#2 웹 크롤링

install.packages("rvest")
install.packages("httr")
library(rvest)
library(httr)

result=list()
n=1

for(i in PAGE){
    url=paste0(url1,keyword,url2,start_date,end_date,url3,i) #쪼개진 url을 합치기
    get_url=GET(url) #url내 정보 가져오기 
    
    title=get_url %>%
        read_html()%>%
        html_nodes('.news_area')%>%
        html_nodes('a')%>%
        html_attr('title') #html 에서 제목 추출
    
    title=title[complete.cases(title)] #결측치제외
    
    result[[n]]=title # 결과를 result 변수에 저장
    n=n+1
}

result=unlist(result) #list를 벡터로 변경
head(result)







#KoNLP 깔기 전에 필요한 패키지들
install.packages("rJava")
install.packages("memoise")

install.packages("devtools")

#깃허브 통해 KoNLP 다운로드
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", force = TRUE, INSTALL_opts=c("--no-multiarch"))

install.packages("tidyverse")
install.packages("stringi")

install.packages("tidytext")
install.packages("textdata")
install.packages("multilinguer")
multilinguer::install_jdk()

install.packages("wordcloud2")


library(rvest)
library(httr)
library(rJava)
library(memoise)
library(stringr)

devtools::install_github("r-lib/conflicted")

library(tidytext)
library(tidyverse)
library(textdata)

library(KoNLP)

library(wordcloud2)



#3.Textmining

result=as_tibble(result) #데이터 형태를 tibble로 변형해줍니다.tibble은 텍스트 마이닝의 가장 좋은 형태
result

result_tb=result%>% #명사단어만 추출
    unnest_tokens(input=value,output=word,token=SimplePos09)%>% #형태소로 분리
    filter(str_detect(word,"/n"))%>% #명사만 추출
    mutate(word=str_remove(word,"/.*$"))%>% #형태소 정보 제거
    filter(str_length(word)>=2) #최소 단어 길이 2자 이상으로 추출. 수정가능!

result_tb

#불용어 삭제
st_word=tibble(word=c('김건희','비용'))

result_tb=result_tb%>%
    anti_join(st_word,by=c("word"="word"))%>% #불용어 삭제
    filter(!grepl(pattern="//d+",word))

result_tb=result_tb%>%
    count(word,sort=TRUE)
result_tb

#3. wordcloud2
wordcloud2(result_tb,color="random-light",fontFamily="나눔바른고딕")
