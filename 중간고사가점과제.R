#------------------------------------------------
#---#CH2-LAB. 다양한 산술 연산 문제 수행하기
#--------------------------------------------------
#산술연산자와 산술연산 함수를 이용하여
#삼각형의 면적, 원의 면적, 초 변환, 거스름돈 계산,
#상금 수여와 같은 다양한 문제를 해결해봅니다.
#--------------------------------------------------
#---#1. 밑변의 길이가 10이고 높이가 5인 삼각형의
#---#   면적을 구해봅니다.

tri=10*5/2 #삼각형의 면적=10(길이) * 5(높이) /2
tri #삼각형 면적 확인

#--------------------------------------------------
#---#2. 반지름이 10인 원의 면적을 계산해봅니다.

r=10 #반지름=10
cir=r^2*pi #원의 면적=반지름의 2제곱 * pi(원주율값)
cir #원의 면적 확인

#--------------------------------------------------
#---#3. 5시간48분 32초를 모두 초로 환산해봅니다.

hours=5 #5시간
mint=48 #48분
sec=32 #32초
totalSec=hours*60*60+mint*60+sec #5시간*60(분)*60(초)+48분*60(초)+32초
totalSec #전체 초 확인

#--------------------------------------------------
#---#4. 마트에서 1,000원 짜리 과자 5봉지와 500원짜리
#---#   사탕 3봉지를 사고 10,000원을 내었을 때
#---#   거스름돈을 계산해봅니다.

snack=1000*5 #과자 1000원*5봉지
candy=500*3 #사탕 500원*3봉지
change=10000-snack-candy #거스름돈=10,000원-과자값-사탕값
change  #거스름돈 확인

#--------------------------------------------------
#---#5. 가장 우수한 성적을 받은 학생에게 점수당
#---#   500원을 상금으로 주려고 합니다. 학생들의
#---#   성적이 63,95,84,36,48일 때 상금을 
#---#   계산해봅니다(산술연산 함수사용)

score=c(63,95,84,36,48) #학생들의 성적 
one=max(score) #학생들의 성적 중 최댓값
reward=one*500 #보상은 최댓값을 받은 학생 점수 * 500원
reward * 보상 확인









