# 패키지
library(readxl)
library(plm)
library(pwr)
library(ggplot2)
library(dunn.test)

data <- read_excel("stat_data.xlsx", sheet = 1)
data
table(data$'희망지역')
table(data$'희망지역_B')

# 문자형 변수 'group'을 숫자로 인코딩
data$group_num1 <- as.numeric(as.factor(data$'희망지역'))
data$group_num2 <- as.numeric(as.factor(data$'희망지역_B'))

table(data$group_num1)
table(data$group_num2)


# 그룹별 점수 평균 구하기
mean.1 <- mean(data$'성취'[data$'희망지역_B'=='수도권'])
mean.2 <- mean(data$'성취'[data$'희망지역_B'=='상관없음'])
cat(mean.1, mean.2)

sd.1 <- sd(data$'성취'[data$'희망지역_B'=='수도권'])
sd.2 <- sd(data$'성취'[data$'희망지역_B'=='상관없음'])
cat(sd.1, sd.2)

effective_size <- abs(mean.1-mean.2) / sqrt((sd.1^2 + sd.2^2)/2)
effective_size

pwr.t.test(d = effective_size, alternative = "two.sided", type = "two.sample", 
           power = 0.8, sig.level = 0.05)


#### 가설설정 ####
## 희망지역_B(수도권VS상관없음)의 직업선택 중요도 항목의 차이가 존재하는가?

# shapiro.test() : 정규분포인지 테스트 해주는 함수
shapiro.test(data$'성취'[data$'희망지역'=='서울'])   # -> 정규분포X
shapiro.test(data$'성취'[data$'희망지역'=='상관없음']) # -> 정규분포X
# 정규분포가 아니므로 t-test 사용 불가
# but 데이터 수가 많아 중심극한정리에 의해 정규분포라 볼 수 있음


# var.test() : 등분산인지 테스트해주는 함수
group1 <- data$'성취'[data$group_num2 == 1]
group2 <- data$'성취'[data$group_num2 == 2]
var.test(group1, group2) # p-value = 4.866e-12 -> 등분산X


### t-test ###
t.test(group1, group2, data=data, alt="two.sided", var.equal=F)
# p-value = 0.002805 -> 0.05보다 작으므로 큰 차이가 존재. 따라서 귀무가설 기각.
# 희망지역(수도권과 상관없음)에 따라 성취도 중요도의 차이가 존재한다.



#### 비모수 검정 ####
## 귀무가설(H0): "희망지역에 따라 수치형 변수의 평균 차이는 없다."
## 대립가설(H1: "희망지역에 따라 수치형 변수의 평균 차이가 있다."
## 성취,이타,인정,신체활동,직업안정,다양성,타인영향,지적추구,애국,경제적보상,심신의안녕,자율

변수목록 <- c('성취','이타','인정','신체활동','직업안정','다양성','타인영향','지적추구','애국','경제적보상','심신의안녕','자율')

for (변수 in 변수목록) {
  print(paste("변수:", 변수))
  print(kruskal.test(as.formula(paste(변수, "~ 희망지역")), data = data))
}

for (변수 in 변수목록) {
  print(paste("변수:", 변수))
  print(wilcox.test(as.formula(paste(변수, "~ 희망지역_B")), data = data))
}


ggplot(data, aes(x = 희망지역_B, y = 이타)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.1) +
  labs(title = "희망지역에 따른 성취 점수 분포", x = "희망지역", y = "성취 점수")

boxplot(성취 ~ 희망지역_B, data = data,
        main = "희망지역에 따른 성취 점수 분포",
        xlab = "희망지역", ylab = "성취 점수")


## 사후검정 ##
dunn.test(data$성취, data$희망지역, method = "bonferroni")

for (변수 in 변수목록) {
  print(paste("변수:", 변수))
  print(dunn.test(data$성취, data$희망지역_B, method = "bonferroni"))
}

