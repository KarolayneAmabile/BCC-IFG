###===============================###
### === DISTRIBUICAO UNIFORME === ###
###===============================###

min=1
max=3

# calculo da densidade de probabilidade
dunif(x=1.75, min=min, max=max)
dunif(x=2, min=min, max=max)
dunif(x=4, min=min, max=max)

# distribuição de probabilidade acumulada até q
punif(q=1.5, min=min, max=max)

# quantil (ou valor) de x correspondente à probabilidade p
qunif(p=0.25, min=min, max=max)

# gerar uma amostra aleatória de tamanho n da distribuição
runif(n=10, min=min, max=max)


# Grafico da função de densidade de probabilidade fdp - f(x)

x<-seq(from=min-1,to=max+1,length.out=100) 
plot(x,dunif(x, min=min, max=max), type="l",
     main = "F.D.P. Uniforme", 
     xlab = 'X', ylab = 'Densidade de probabilidade') 



# Grafico da distribuição acumulada
q<-seq(from=min-1,to=max+1,length.out=100) 
plot(q,punif(q, min=min, max=max), type="l",
     main = "F.D.A. Uniforme", 
     xlab = 'X', ylab = 'Probabilidade Acumulada') 



#== Verificar esperança e variância da uniforme ==#

# valores teóricos da distribuição:
mean_unif = (min+max)/2; mean_unif
var_unif = ((max-min)^2)/12; var_unif

#gerar uma amostra (vetor) com muitas repetições
vet = runif(n=10000, min=min, max=max)

# media e variancia da amostra
mean(vet)
var(vet)


# gráfico da distribuição
hist(vet,  main = "Distribuição da amostra Uniforme aleatória", 
     xlab = 'X', ylab = 'Contagem')


hist(vet, probability = TRUE, main = "Distribuição da densidade da amostra Uniforme aleatória", 
     xlab = 'X', ylab = 'Densidade')

x<-seq(from=min,to=max,length.out=100) 
fun = dunif(x, min=min, max=max)
lines(x, fun, col = 2, lwd = 2)







###==================================###
### === DISTRIBUICAO EXPONENCIAL === ###
###==================================###

lambda=2

# calculo da densidade de probabilidade
dexp(x=0.5, rate=lambda)
dexp(x=2, rate=lambda)
dexp(x=5, rate=lambda)

# distribuição de probabilidade acumulada até q
pexp(q=2, rate=lambda)

# quantil (ou valor) de x correspondente à probabilidade p
qexp(p=0.98, rate=lambda)

# gerar uma amostra aleatória de tamanho n da distribuição
rexp(n=10, rate=lambda)


# Grafico da função de densidade de probabilidade fdp - f(x)

x<-seq(from=0,to=5,length.out=100) 
plot(x,dexp(x, rate=lambda), type="l",
     main = "F.D.P. Exponencial", 
     xlab = 'X', ylab = 'Densidade de probabilidade') 



# Grafico da distribuição acumulada
q<-seq(from=0,to=5,length.out=100) 
plot(q,pexp(q, rate=lambda), type="l",
     main = "F.D.A. Exponencial", 
     xlab = 'X', ylab = 'Probabilidade Acumulada') 



#== Verificar esperança e variância da exponoencial ==#

# valores teóricos da distribuição:
mean_exp = 1/lambda; mean_exp
var_exp = 1/lambda^2; var_exp

#gerar uma amostra (vetor) com muitas repetições
vet = rexp(n=1000, rate=lambda)

# media e variancia da amostra
mean(vet)
var(vet)


# gráfico da distribuição
hist(vet,  main = "Distribuição da amostra exponencial aleatória", 
     xlab = 'X', ylab = 'Contagem')


hist(vet, probability = TRUE, main = "Distribuição da densidade da amostra exponencial aleatória", 
     xlab = 'X', ylab = 'Contagem')

x<-seq(from=0,to=5,length.out=100) 
fun = dexp(x, rate=lambda)
lines(x, fun, col = 2, lwd = 2)




###===============================###
### === DISTRIBUICAO NORMALL === ###
###==============================###

mu=2
sigma=1

# calculo da densidade de probabilidade
dnorm(x=2, mean=mu, sd=sigma)
dnorm(x=1, mean=mu, sd=sigma)
dnorm(x=3, mean=mu, sd=sigma)

# distribuição de probabilidade acumulada até q
pnorm(q=2, mean=mu, sd=sigma)
pnorm(q=-1, mean=mu, sd=sigma)
pnorm(q=1, mean=mu, sd=sigma)
pnorm(q=3, mean=mu, sd=sigma)
pnorm(q=4, mean=mu, sd=sigma)

# quantil (ou valor) de x correspondente à probabilidade p
qnorm(p=0.5, mean=mu, sd=sigma)
qnorm(p=0.25, mean=mu, sd=sigma)
qnorm(p=0.90, mean=mu, sd=sigma)
qnorm(p=0.95, mean=mu, sd=sigma)

# gerar uma amostra aleatória de tamanho n da distribuição
rnorm(n=10, mean=mu, sd=sigma)


# Grafico da função de densidade de probabilidade fdp - f(x)

x<-seq(from=-2,to=6,length.out=100) 
plot(x,dnorm(x, mean=mu, sd=sigma), type="l",
     main = "F.D.P. Normal", 
     xlab = 'X', ylab = 'Densidade de probabilidade') 



# Grafico da distribuição acumulada
q<-seq(from=-2,to=6,length.out=100) 
plot(q,pnorm(q, mean=mu, sd=sigma), type="l",
     main = "F.D.A. Normal", 
     xlab = 'X', ylab = 'Probabilidade Acumulada') 



#== Verificar esperança e variância da normal ==#

# valores teóricos da distribuição:
mean_norm = mu; mean_norm
var_norm = sigma^2; var_norm

#gerar uma amostra (vetor) com muitas repetições
vet = rnorm(n=1000, mean=mu, sd=sigma)

# media e variancia da amostra
mean(vet)
var(vet)


# gráfico da distribuição
hist(vet,  main = "Distribuição da amostra normal aleatória", 
     xlab = 'X', ylab = 'Contagem')


hist(vet, probability = TRUE, main = "Distribuição da densidade da amostra normal aleatória", 
     xlab = 'X', ylab = 'Contagem')

x<-seq(from=-2,to=6,length.out=100) 
fun = dnorm(x, mean=mu, sd=sigma)
lines(x, fun, col = 2, lwd = 2)



