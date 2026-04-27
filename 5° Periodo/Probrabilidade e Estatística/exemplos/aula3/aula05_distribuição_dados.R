####################################################
##### Codigos da aula - Histogramas e Boxplots #####
####################################################

## Exemplo 1

# Turma da tarde
tarde = c(12,19,24,25,26,26,26,26,29,30,
          32,32,33,33,40,40,40,40,40,41,
          42,42,42,42,43,43,43,43,43,44,
          45,47,47,48,48,48,50,50,50,52,
          52,53,53,60,60,60,60,60,60,60,
          60,61,61,64,68,72,72,72,75,75,
          80,95)

# Turma da noite
noite = c(05,18,18,22,22,23,30,32,40,40,
          40,41,41,42,42,43,45,45,45,45,
          47,47,48,48,51,52,52,53,53,60,
          60,60,60,60,60,60,60,62,62,62,
          63,63,63,64,65,65,66,68,70,70,
          70,70,72,72,72,72,74,75,75,80,
          80,82,83,85,88,95)

# sumario dos dados
summary(tarde)
summary(noite)


# tambem pode usar
quantile(tarde)
quantile(noite)
mean(tarde)
mean(noite)

# desvio padrao e coeficiente de variacao
sd(tarde)
sd(noite)

sd(tarde)/mean(tarde)
sd(noite)/mean(noite)


#################################################
### CONSTRUINDO BOXPLOTS
#################################################

boxplot(tarde)
boxplot(tarde, noite)

# acrescentando a media nos boxplots
medias=c(mean(tarde),mean(noite))
boxplot(tarde, noite, names=c("Tarde", "Noite"))
points(medias, pch=20)




#################################################
### CONSTRUINDO HISTOGRAMAS
#################################################

#basicao
hist(tarde)


# melhorando informações
hist(tarde,main="Histograma - Tarde", xlab="Intervalo", ylab="Frequência")


# com frerquencia relativa
hist(tarde,main="Histograma - Tarde", xlab="Intervalo", ylab="Densidade", prob=TRUE)


# se quiser mudar os intervalos
hist(tarde, breaks=c(12,24,36,48,60,72,84,96),
     main="Histograma - Tarde", xlab="Intervalo", ylab="Frequência")

# Observação importante: O R fecha os intervalos à direita. Tem como mudar:
hist(tarde, breaks=c(12,24,36,48,60,72,84,96), right = FALSE,
     main="Histograma - Tarde", xlab="Intervalo", ylab="Frequência")



# Histograma com frerquencia relativa + densidade + media e mediana
hist(tarde,main="Histograma - Tarde", xlab="Intervalo", ylab="Densidade", prob=TRUE)
lines(density(tarde), lwd=1, col="purple")
abline(v=mean(tarde), col="red")         
abline(v=median(tarde), col="blue") 
legend("right", lty=c(1,1,1), legend=c("Média", "Mediana", "Densidade"),
       col=c("red", "blue","purple"),box.lty=0, cex=1)



# Histograma com frerquencia relativa + densidade + media e mediana
hist(noite,main="Histograma - Noite", xlab="Intervalo", ylab="Densidade", prob=TRUE)
lines(density(noite), lwd=1, col="purple")
abline(v=mean(noite), col="red")         
abline(v=median(noite), col="blue") 
legend("right", lty=c(1,1,1), legend=c("Média", "Mediana", "Densidade"),
       col=c("red", "blue","purple"),box.lty=0, cex=1)




# mudando os intervalos e as densidades de frequencia
hist(tarde,  breaks=c(10,20,30,40,50,60,70,80,90,100), main="Histograma - Tarde", xlab="Intervalo", prob=TRUE)
hist(tarde,  breaks=c(10,20,30,40,50,60,70,80,100), main="Histograma - Tarde", xlab="Intervalo", prob=TRUE)

# Cuidado ao mexer demais nos intervalos. Olha esse exemplo:
hist(tarde,  breaks=c(10,30,50,70,90,110), main="Histograma - Tarde", xlab="Intervalo", prob=TRUE)
lines(density(tarde), lwd=1, col="purple")

# Uma dica muito boa!!!
# Com o R voce consegue construir a tabela de frequencia a partir do histograma!!!
# basta criar um objeto com o Histograma e puxar as informações dele, veja:
# crie o objeto com o nome "tab" que vai receber o histograma
tab = hist(tarde)
names(tab)

#extrair os limites dos intervalos
tab$breaks

#extrair a frequencia das classes
tab$counts

#extrair a densidade das classes
tab$density




#################################################
### MOMENTOS, ASSIMETRIA E CURTOSE
#################################################

# momento de ordem 3
momento_3 = (sum((tarde - mean(tarde))^3))/length(tarde); momento_3

# assimetria pela definição
ass_1 = momento_3/sd(tarde)^3; ass_1

# assimetria pela aproximação
ass_2 = 3*(mean(tarde) - median(tarde))/sd(tarde); ass_2



# momento de ordem 4
momento_4 = (sum((tarde - mean(tarde))^4))/length(tarde); momento_4

# curtose pela definição
curt_1 = momento_4/sd(tarde)^4; curt_1




# Para os momentos, assimetria e curtose podemos usar o pacote "moments"

#install.packages("moments")
require(moments)

skewness(tarde)

kurtosis(tarde)


moment(x=tarde, order = 3, central = mean(tarde))


# Podemos também criar uma funcao para isso (ou qualquer outra coisa)

m3 <- function(vetor){
  
  aux = (sum((vetor - mean(vetor))^3))/length(vetor)
  
  return(aux)
  
}

m3(tarde)
m3(noite)

##

assimetria <- function(x){
  
  aux1 = (sum((x - mean(x))^3))/length(x)
  aux2 = aux1/sd(x)^3
  
  return(aux2)
}

assimetria(tarde)
assimetria(noite)

##

curtose <- function(x){
  
  aux1 = (sum((x - mean(x))^4))/length(x)
  aux2 = aux1/sd(x)^4
  
  return(aux2)
  
}

curtose(tarde)
curtose(noite)









##### VARIOS EXEMPLOS DE HISTOGRAMAS COM DIFERENTES FORMATOS

vec1=c(79.55, 83.22, 80.98, 83.75, 78.78, 75.22, 77.98, 80.08, 88.26, 76.92, 79.46, 84.43, 78.82, 84.73, 87.82,
       79.77, 73.59, 83.92, 73.23, 79.21, 75.38, 78.65, 80.51, 74.74, 78.59, 78.12, 82.61, 80.65, 74.75, 81.76,
       83.11, 83.39, 85.11, 81.38, 71.55, 78.57, 80.34, 75.56, 82.82, 84.36, 78.08, 82.70, 82.69, 78.59, 87.88,
       76.37, 85.27, 86.06, 85.03, 82.54, 80.79, 70.10, 69.83, 69.66, 80.70, 87.31, 75.41, 80.05, 80.86, 78.49,
       79.15, 80.06, 72.09, 77.43, 84.61, 91.40, 82.29, 78.60, 74.30, 78.78, 83.75, 84.42, 80.23, 80.12, 74.05,
       75.46, 72.20, 81.32, 80.36, 79.17, 86.99, 80.00, 73.23, 75.43, 78.87, 76.65, 74.06, 94.26, 73.18, 83.49,
       77.55, 77.32, 76.77, 77.60, 79.16, 79.49, 81.33, 73.43, 80.95, 74.60)
hist(vec1, prob=TRUE, nclass=10, main="Histograma - Vetor 1")
lines(density(vec1), lwd = 2, col = 'purple')
abline(v=mean(vec1), col="red")         # acrescentar a linha da media
abline(v=median(vec1), col="blue") 
legend("right", lty=c(1,1,1), legend=c("Média", "Mediana", "Densidade"),
       col=c("red", "blue","purple"),box.lty=0, cex=1)





vec2=c(9.80,7.55,8.95,6.18,8.21,7.56,7.64,7.04,7.12,8.60,6.19,7.83,7.75,6.95,9.37,
       8.37,8.15,6.46,8.41,9.47,9.36,7.33,7.37,7.26,6.37,8.00,9.73,9.27,7.45,6.28,
       7.24,7.92,9.05,7.90,7.46,8.88,8.02,6.56,9.98,6.61,6.84,8.93,7.52,7.29,8.77,
       8.16,8.70,9.79,6.43,7.14,6.39,7.56,8.01,8.96,7.60,7.93,8.41,8.03,9.91,6.29,
       9.27,6.64,8.47,8.75,9.03,6.93,8.43,7.17,6.68,6.68,8.68,8.19,6.48,7.29,7.97,
       6.06,8.31,9.51,9.75,7.04,8.14,6.34,9.73,7.39,8.68,6.83,7.62,8.87,6.18,7.26,
       8.14,6.32,9.74,7.94,6.65,7.62,9.69,7.39,7.94,9.02)

hist(vec2, prob=TRUE, nclass=8)
lines(density(vec2), lwd = 2, col = 'purple')
abline(v=mean(vec2), col="red")         # acrescentar a linha da media
abline(v=median(vec2), col="blue") 
legend("right", lty=c(1,1,1), legend=c("Média", "Mediana", "Densidade"),
       col=c("red", "blue","purple"),box.lty=0, cex=1)






vec3=c(0.04,0.05,0.02,0.23,0.81,1.95,0.29,0.30,0.01,0.76,0.49,0.09,0.27,0.90,1.12,
       0.17,0.07,0.35,0.66,0.00,1.92,0.25,0.93,0.69,0.05,0.87,1.04,1.07,0.00,1.27,
       0.20,0.94,1.16,0.45,1.49,0.34,0.21,0.30,1.46,0.01,0.20,0.37,0.46,1.95,0.29,
       1.29,0.23,0.74,0.31,0.09,0.16,0.93,0.51,1.02,2.63,0.85,0.41,0.14,1.76,0.45,
       0.45,0.73,0.11,0.49,0.79,0.30,0.93,1.80,0.51,0.08,0.56,0.33,0.18,0.60,0.96,
       1.08,0.29,0.45,0.33,1.03,0.15,0.33,0.03,1.12,0.05,0.31,0.69,0.08,0.16,1.55,
       0.77,1.43,1.19,1.82,0.64,0.04,1.23,0.14,0.41,0.67)

hist(vec3, prob=TRUE, nclass=8)
lines(density(vec3), lwd = 2, col = 'purple')
abline(v=mean(vec3), col="red")         # acrescentar a linha da media
abline(v=median(vec3), col="blue") 
legend("right", lty=c(1,1,1), legend=c("Média", "Mediana", "Densidade"),
       col=c("red", "blue","purple"),box.lty=0, cex=1)





vec4=c(0.74,13.09,0.77,7.70,2.19,5.30,9.16,0.93,4.34,2.55,4.27,1.82,2.09,1.56,2.08,
       2.02,4.79,2.13,2.57,2.29,2.19,3.06,0.46,3.35,6.93,2.77,0.31,4.18,1.85,7.35,
       9.75,2.93,3.34,1.25,1.80,1.25,1.96,7.43,2.03,7.74,3.77,0.79,5.28,3.29,4.02,
       1.99,4.65,2.57,7.84,4.33,14.17,1.70,3.24,9.26,1.59,3.91,2.64,3.38,3.72,2.56,
       1.37,2.41,9.56,8.61,6.68,1.25,5.29,2.06,3.22,3.26,3.21,2.28,3.12,2.89,3.84,
       2.99,2.98,1.52,10.05,0.14,4.76,1.98,3.39,1.72,4.65,2.32,3.32,3.28,2.10,0.78,
       7.81,1.38,6.95,6.69,8.40,0.73,8.54,5.80,2.67,1.28)

hist(vec4, prob=TRUE, nclass=10)
lines(density(vec4), lwd = 2, col = 'purple')
abline(v=mean(vec4), col="red")         # acrescentar a linha da media
abline(v=median(vec4), col="blue") 
legend("right", lty=c(1,1,1), legend=c("Média", "Mediana", "Densidade"),
       col=c("red", "blue","purple"),box.lty=0, cex=1)





vec5=c(0.55,0.88,0.83,0.96,0.82,0.61,0.94,0.82,0.92,0.95,0.58,0.80,0.55,0.59,0.97,
       0.36,0.51,0.96,0.48,0.90,0.69,0.99,0.87,0.75,0.65,0.73,0.74,0.85,0.78,0.95,
       0.90,0.86,0.98,0.65,0.86,0.65,0.95,0.82,0.81,0.77,0.86,0.75,0.85,0.71,0.61,
       0.86,0.51,0.66,0.79,0.83,0.91,0.85,0.63,0.88,0.78,0.94,0.21,0.72,0.87,0.78,
       0.83,0.70,0.37,0.96,0.99,0.70,0.95,0.71,0.29,0.56,0.99,0.98,0.99,0.84,0.74,
       0.86,0.70,0.92,0.74,0.92,0.88,0.92,0.95,0.94,0.97,0.99,0.95,0.93,0.95,0.99,
       0.81,0.81,0.64,0.89,0.87,0.46,0.97,0.84,0.80,0.96)

hist(vec5, prob=TRUE, nclass=10)
lines(density(vec5), lwd = 2, col = 'purple')
abline(v=mean(vec5), col="red")         # acrescentar a linha da media
abline(v=median(vec5), col="blue") 
legend("right", lty=c(1,1,1), legend=c("Média", "Mediana", "Densidade"),
       col=c("red", "blue","purple"),box.lty=0, cex=1)





vec6=c(9.83,11.63,9.96,10.87,10.03,12.55,10.96,12.33,10.03,12.12,9.58,13.59,11.77,9.77,9.59,
       9.91,8.67,6.81,6.85,7.53,8.62,10.27,8.14,10.78,8.53,10.94,6.73,
       10.27,12.91,8.52,12.14,10.46,13.08,12.16,12.22,11.06,9.07,8.95,8.53,10.46,
       7.99,11.08,10.07,11.32,13.94,10.09,8.23,9.12,6.87,8.32,11.30,9.27,13.30,9.69,
       9.79,11.53,8.81,10.07,11.92,10.96,14.02,9.10,7.55,9.36,10.78,9.69,8.02,6.30,
       7.85,9.52,10.99,10.35,8.23,11.25,7.35,8.35,10.09,12.86,13.43,13.62,11.69,9.58,
       9.49,9.30,11.36,9.34,7.36,11.35,8.55,8.98,10.30,11.70,11.69,8.51,7.48,10.74,
       10.63,9.92,9.11,11.88,25.01,20.08,23.46,23.47,16.03,20.45,20.94,21.09,20.50,
       20.21,14.28,20.58,19.05,20.00,22.79,22.32,21.34,25.07,19.68,23.92)

hist(vec6, prob=TRUE, nclass=10)
lines(density(vec6), lwd = 2, col = 'purple')
abline(v=mean(vec6), col="red")         # acrescentar a linha da media
abline(v=median(vec6), col="blue") 
legend("right", lty=c(1,1,1), legend=c("Média", "Mediana", "Densidade"),
       col=c("red", "blue","purple"),box.lty=0, cex=1)






vec7=c(12.44,8.68,6.45,14.21,11.55,10.71,9.88,10.07,7.46,11.37,10.52,11.49,9.27,
       5.58,11.44,8.61,10.65,10.82,12.58,9.80,7.57,8.96,10.47,10.16,9.31,8.17,
       9.01,8.82,11.00,10.57,8.46,11.65,10.66,9.64,10.14,6.43,6.95,6.80,10.53,6.74,
       11.98,10.94,11.60,11.29,6.61,7.97,8.66,7.07,10.77,10.50,9.80,10.04,6.52,8.33,
       8.53,8.00,9.09,9.02,8.66,10.22,8.27,12.23,5.01,7.76,9.77,4.73,8.70,8.11,9.86,
       12.78,10.74,12.44,6.91,10.97,7.48,9.52,11.34,8.44,10.20,8.64,10.29,10.64,
       9.24,10.00,7.60,9.58,6.84,12.36,8.74,6.68,11.76,9.54,10.10,8.42,11.95,12.11,
       9.13,10.53,11.63,10.82,25.22,21.85,23.25,17.59,15.45,19.66,20.93,22.38,20.84,
       21.87,16.60,25.54,19.47,18.61,19.10,20.71,19.97,23.23,21.10,19.71,25.82,20.07,
       28.34,19.10,19.86,21.62,24.62,23.05,16.59,13.51,23.85,19.72,22.75,20.81,20.00,
       22.13,15.10,25.62,16.62,24.91,21.52,20.70,20.87,21.87,21.88,19.20,17.76,12.52,
       17.47,20.39,21.17,21.84,21.59,24.13,20.04,22.04,17.57,24.01,18.21,13.37,21.20,
       19.07,18.69,17.46,21.57,20.49,22.85,19.38,15.10,20.91,22.43,20.53,21.18,19.25,
       22.03,20.08,20.57,19.80,20.36,19.56,19.78,13.89,19.10,19.38,18.47,18.58,22.64,
       2.95,18.56,22.40,21.34,19.75,18.81,18.28,25.69,22.23,16.97,24.05,15.71,20.38)

hist(vec7, prob=TRUE, nclass=10)
lines(density(vec7), lwd = 2, col = 'purple')
abline(v=mean(vec7), col="red")         # acrescentar a linha da media
abline(v=median(vec7), col="blue") 
legend("right", lty=c(1,1,1), legend=c("Média", "Mediana", "Densidade"),
       col=c("red", "blue","purple"),box.lty=0, cex=1)




