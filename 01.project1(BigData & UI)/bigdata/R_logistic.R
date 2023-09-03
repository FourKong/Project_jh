data <- read.csv("C:/Users/125wi/Desktop/JH_Project/final_data.csv" , header = TRUE, fileEncoding = "CP949", encoding = "UTF-8")
data

model <-lm(sat_all ~ ., data=data)
summary(model)

length(data)
living_data <- data[,c(1:25)]
living_data

model <-lm(sat_living ~ ., data=living_data)
summary(model)

# 데이터 로드
data <- read.csv("data.csv")

# sat_living을 0에서 10까지의 범주로 변환하여 요인으로 생성
living_data$sat_living <- factor(data$sat_living, levels = 0:10)
data$sat_all <- factor(data$sat_all, levels = 0:10)
# 순서형 로지스틱 회귀 분석
library(MASS)
library(AER)
model <- polr(sat_living ~ ., data = living_data)
model <- polr(sat_all ~ ., data = data)
summary(model)

coeftest(model)
