#############################################
#### Codigos da aula - Analise Bivariada ####
####      Quantitativa x Quantitativa    ####
####           Correlação Linear         ####
#############################################


### Conjunto A - correlação positiva forte
x=c(1:10)
y=c(2,0,6,3,9,4,10,8,12,8)

plot(x,y, main="Diagrama de Dispersão - Conjunto A")

cor(x,y)

# para plotar a tal "reta imaginária"
lm(y~x)
abline(lm(y~x), col="red")



### Conjunto B - correlação negativa forte
x=c(1:10)
y=c(8,12,8,10,4,9,3,6,0,2)

plot(x,y, main="Diagrama de Dispersão - Conjunto B")

cor(x,y)

lm(y~x)
abline(lm(y~x), col="red")



### Conjunto C- correlação nula
x=c(1:10)
y=c(3,1,6,4,3,2,6,4,3,2)

plot(x,y, main="Diagrama de Dispersão - Conjunto C")

cor(x,y)

lm(y~x)
abline(lm(y~x), col="red")



### Conjunto D - correlação positiva fraca
x=c(1:10)
y=c(6,3,5,7,2,11,9,3,6,8)

plot(x,y, main="Diagrama de Dispersão - Conjunto D")

cor(x,y)

lm(y~x)
abline(lm(y~x), col="red")



### Conjunto E - correlação positiva forte
x=c(1:10)
y=c(2,6,5,8,6,9,10,8,12,10)

plot(x,y, main="Diagrama de Dispersão - Conjunto E")

cor(x,y)

lm(y~x)
abline(lm(y~x), col="red")



### Conjunto F - correlação positiva perfeita
x=c(1:10)
y=c(3:12)

plot(x,y, main="Diagrama de Dispersão - Conjunto F")

cor(x,y)

lm(y~x)
abline(lm(y~x), col="red")



###########################################
## Exemplo com dados de Expectativa de vida
###########################################

tab = read.table("life_expectancy.csv", head=TRUE, sep=";", dec=",")

## comparando escolaridade com expectativa de vida

plot(tab$Schooling, tab$Life_expectancy)

cor(tab$Schooling, tab$Life_expectancy)

abline(lm(tab$Life_expectancy ~ tab$Schooling), col="red")



## comparando consumo de álcool com expectativa de vida

plot(tab$Alcohol_consumption, tab$Life_expectancy)

cor(tab$Alcohol_consumption, tab$Life_expectancy)

abline(lm(tab$Life_expectancy ~ tab$Alcohol_consumption), col="red")


## comparando consumo de álcool com expectativa de vida

plot(tab$Alcohol_consumption, tab$Life_expectancy)

cor(tab$Alcohol_consumption, tab$Life_expectancy)

abline(lm(tab$Life_expectancy ~ tab$Alcohol_consumption), col="red")



## comparando renda per capta com expectativa de vida

plot(tab$GDP_per_capita, tab$Life_expectancy)

cor(tab$GDP_per_capita, tab$Life_expectancy)

abline(lm(tab$Life_expectancy ~ tab$GDP_per_capita), col="red")



## Para plotar todos os diagramas de um banco de dados de uma só vez, usar "pairs"

# Se o banco só tiver variáveis numéricas, uisar:
# pairs(tab)

# Se tiver qualitativas, tirar elas filtrando apenas as numéricas:
pairs(tab[sapply(tab, is.numeric)])
