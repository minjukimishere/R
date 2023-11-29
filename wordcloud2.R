#네이버 오픈 api로 '미세먼지' 블로그 검색하기

library(RCurl) #일반적인 HTTP 요청 (다운로드)
library(RmecabKo) #한글 문장의 형태소 분석
library(wordcloud) #워드 클라우드 출력
library(XML) #로컬, 웹에 연결된 XML, HTML 문서 읽음
library(wordcloud2)
library(KoNLP)
library(tm)
library(SnowballC)
library(httr)

url_base = "https://openapi.naver.com/v1/search/blog.xml?"
search_word = "query=대기오염"

# UTF-8 인코딩은 iconv() 함수 이용
search_word_utf8 = iconv(search_word, to = "UTF-8")

# URL 인코딩은 URLencode() 함수 이용
search_word_utf8_url = URLencode(search_word_utf8)

Encoding(search_word_utf8)
Encoding(search_word_utf8_url)

search_word_utf8_url

# 출력 건수 100개
display_api = "display=100"

# 검색 시작위치 1
start_api = "start=1"

# 정렬옵션 = sim(유사도순)
sort_api = "sort=sim"

# GET 방식 : 각 요청변수는 &로 연결
request_var = paste("", display_api, start_api, sort_api, sep="&")

# 요청변수 연결 확인
request_var

url_api = paste(url_base, search_word_utf8_url, request_var, sep="")

url_api

# 네이버 Open API 등록시의 인증정보
client_id = "9jBc0SasY579BldJ16Uj"

client_secret = "iVNcrYGtfP"

# 인증정보를 담아 GET 함수로 네이버 Open API 호출 
result_api = GET(url_api, add_headers("X-Naver-Client-Id"=client_id, "X-Naver-Client-Secret"=client_secret))

result_api

str(result_api)

result_api$content

result = rawToChar(result_api$content)

Encoding(result) = "UTF-8"

result

# XML 태그를 공란으로 치환
result_refined <- gsub("<(\\/?)(\\w +)*([^<>]*)>", " ", result)

# 단락을 표현하는 불필요한 문자를 공란으로 치환
result_refined <- gsub("[[:punct:]]", " ", result_refined)

# 영어 소문자를 공란으로 치환
result_refined <- gsub("[a-z]", " ", result_refined)

# 숫자를 공란으로 치환
result_refined <- gsub("[0-9]", " ", result_refined)

# 여러 공란은 한 개의 공란으로 변경
result_refined <- gsub(" +", " ", result_refined)

result_refined

result_noun = extractNoun(result_refined)

head(result_noun, 50)

# 길이가 1인 문자를 제외
 result_noun_refined = result_noun[nchar(result_noun)>1]

 head(result_noun_refined, 50)
 
 nouns_excluded = c("API","주변","안남","얼마","나로썬","알음알음","들이")
 
 noun_final = result_noun_refined[!result_noun_refined %in% nouns_excluded]

 head(noun_final, 50) 
 
 str(noun_final)

 word = sort(table(noun_final), decreasing=T)[1:50]
 
 word

 noun_final
 
 wordcloud2(data = word, size = 3, shape = 'diamond')
 
 