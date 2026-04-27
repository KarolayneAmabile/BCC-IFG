######################################################
########## Aula 04 - Medidas de Dispersão ############
######################################################

## Exemplo 01 - quantiles ##

vec1 = c(13, 13, 13, 13, 15, 16, 20, 20, 20, 30, 250)

quantile(vec1, probs = 0.50)
median(vec1)

quantile(vec1, 0.25)

quantile(vec1, 0.30)

quantile(vec1, 0.95)

quantile(vec1, 0.45)

quantile(vec1, 0.10)

## Para achar todos os quartis
quantile(vec1)

## resumo das medidas relevantes
summary(vec1)



## Exemplo 02 - amplitude

vec2 = c(4, 7, 6, 8, 10)

amp = max(vec2) - min(vec2); amp





## Exemplo 03 - Distancia interquartilica ##

vec3 = c(16, 22, 23, 28, 29, 29, 30, 30, 30, 31, 35, 37, 40, 43, 55)

DI = quantile(vec3, 0.75) - quantile(vec3, 0.25); DI

DI = quantile(vec3)[4] - quantile(vec3)[2]; DI

## Se quiser deixer em formato de número
DI = as.numeric(quantile(vec3, 0.75) - quantile(vec3, 0.25)); DI



## Exemplo 04 - Desvio padrão, variancia e coeficiente de variação

vec4a = c(4, 7, 6, 8, 10) 

# variancia
var(vec4a)

# desvio padrão
sd(vec4a)

# coeficiente de variação
CV = sd(vec4a)/mean(vec4a); CV



vec4b = c(6.9, 7.5, 7.6, 7.8, 8.9, 9.4, 9.8, 11.3, 11.3, 11.6)

var(vec4b)

sd(vec4b)

CV = sd(vec4b)/mean(vec4b); CV




## Exemplo 5 - Média e Variância para dados agrupados ##

bounds = c(40, 50, 60, 70, 80, 90, 100, 110)
freq = c(1, 3, 5, 20, 11, 8, 2)
n=sum(freq)

ponto_medio = (bounds[-length(bounds)]+ bounds[-1])/2

med_group = sum(ponto_medio*freq)/sum(freq); med_group

var_group = (sum(freq*ponto_medio^2) - (sum(freq*ponto_medio)^2)/n)/(n-1)
var_group
sd_group = sqrt(var_group); sd_group



###### EXEMPLOS FINAIS ######

### Exemplo 06
vec06 = c(60, 62, 65, 65, 66, 68, 70, 70, 72, 73, 74, 74, 74, 75, 76, 77, 77, 77, 
          80, 80, 81, 81, 81, 81, 83, 85, 86, 86, 86, 87, 87, 88, 89, 89, 89, 89, 
          89, 90, 90, 91, 91, 91, 91, 91, 93, 93, 95, 96, 96, 98, 98, 100, 101, 
          101, 102, 103, 103, 105, 107, 108, 110, 111, 113 )


summary(vec06)

median(vec06)
mean(vec06)
var(vec06)
sd(vec06)

max(vec06)
min(vec06)
quantile(vec06)

Amp = max(vec06) - min(vec06); Amp
DI = quantile(vec06)[4] - quantile(vec06)[2]; DI
CV = sd(vec06)/mean(vec06); CV


## histograma
hist(vec06, main="Histograma - Exemplo 06")

## histograma com media e mediana destacadas
hist(vec06, main="Histograma - Exemplo 06")
abline(v=mean(vec06), col="red")         
abline(v=median(vec06), col="blue") 
legend("topright", lty=c(1,1), legend=c("Média", "Mediana"),
       col=c("red", "blue"),box.lty=0, cex=1)




### Exemplo 07
vec07 = c(0.25, 0.54, 0.66, 0.67, 0.88, 0.95, 1.10, 1.24, 1.29, 1.31, 
          1.35, 1.48, 1.54, 1.56, 1.69, 1.71, 1.91, 2.01, 2.08, 2.12 , 
          2.13, 2.26, 2.41, 2.50, 2.56, 2.70, 2.76, 2.81, 2.91, 2.97, 
          3.28, 3.32, 3.50, 3.67, 3.95, 3.99, 4.12, 4.27, 4.32, 4.90, 
          5.30, 5.42, 5.66, 5.72, 6.22, 7.08, 7.43, 8.65, 9.00, 11.60)

summary(vec07)

mean(vec07)
var(vec07)
sd(vec07)

max(vec07)
min(vec07)
quantile(vec07)

Amp = max(vec07) - min(vec07); Amp
DI = quantile(vec07)[4] - quantile(vec07)[2]; DI
CV = sd(vec07)/mean(vec07); CV


## histograma
hist(vec07, main="Histograma - Exemplo 07")

## histograma com media e mediana destacadas
hist(vec07, main="Histograma - Exemplo 07")
abline(v=mean(vec07), col="red")         
abline(v=median(vec07), col="blue") 
legend("topright", lty=c(1,1), legend=c("Média", "Mediana"),
       col=c("red", "blue"),box.lty=0, cex=1)



