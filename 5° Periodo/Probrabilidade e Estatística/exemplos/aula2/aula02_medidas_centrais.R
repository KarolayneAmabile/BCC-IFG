###############################################
########## Aula - Medidas Centrais ############
###############################################


## Exemplos 1 a 3 - média, media e "moda" ##

vetor = c(16, 22, 23, 28, 29, 29, 30, 30, 30, 31, 35, 37, 40, 43, 55)

## Media
mean(vetor)

## Mediana
median(vetor)

## "Moda"
table(vetor)




## Exemplo 4 - Média ponderada ##

empregados = c(30, 50, 40)
salario = c(1000, 1300, 1700)

med_pond = sum(empregados*salario)/sum(empregados); med_pond



## Exemplo 5 - Média para dados agrupados ##

bounds = c(40, 50, 60, 70, 80, 90, 100, 110)
freq = c(1, 3, 5, 20, 11, 8, 2)

ponto_medio = (bounds[-length(bounds)]+ bounds[-1])/2

med_group = sum(ponto_medio*freq)/sum(freq); med_group



### Exemplo 6 ###

vec6 = c(60, 62, 65, 65, 66, 68, 70, 70, 72, 73, 74, 74, 74, 75, 76, 77, 77, 77, 
         80, 80, 81, 81, 81, 81, 83, 85, 86, 86, 86, 87, 87, 88, 89, 89, 89, 89, 
         89, 90, 90, 91, 91, 91, 91, 91, 93, 93, 95, 96, 96, 98, 98, 100, 101, 
         101, 102, 103, 103, 105, 107, 108, 110, 111, 113 )


mean(vec6)

median(vec6)

## histograma
hist(vec6, main="Histograma - Exemplo 6")

## histograma com media e mediana destacadas
hist(vec6, main="Histograma - Exemplo 6")
abline(v=mean(vec6), col="red")         
abline(v=median(vec6), col="blue") 
legend("topright", lty=c(1,1), legend=c("Média", "Mediana"),
       col=c("red", "blue"),box.lty=0, cex=1)






### Exemplo 7
vec7 = c(0.25, 0.54, 0.66, 0.67, 0.88, 0.95, 1.10, 1.24, 1.29, 1.31, 
         1.35, 1.48, 1.54, 1.56, 1.69, 1.71, 1.91, 2.01, 2.08, 2.12 , 
         2.13, 2.26, 2.41, 2.50, 2.56, 2.70, 2.76, 2.81, 2.91, 2.97, 
         3.28, 3.32, 3.50, 3.67, 3.95, 3.99, 4.12, 4.27, 4.32, 4.90, 
         5.30, 5.42, 5.66, 5.72, 6.22, 7.08, 7.43, 8.65, 9.00, 11.60)

mean(vec7)

median(vec7)


## histograma
hist(vec7, main="Histograma - Exemplo 7")

## histograma com media e mediana destacadas
hist(vec7, main="Histograma - Exemplo 7")
abline(v=mean(vec7), col="red")         
abline(v=median(vec7), col="blue") 
legend("topright", lty=c(1,1), legend=c("Média", "Mediana"),
       col=c("red", "blue"),box.lty=0, cex=1)
