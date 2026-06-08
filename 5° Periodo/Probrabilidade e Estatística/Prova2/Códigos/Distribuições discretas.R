###===============================###
### === DISTRIBUICAO BINOMIAL === ###
###===============================###

size=3
prob=0.5

# calculo de probabilidade (ou densidade de probabilidade)
dbinom(x=1, size=size, prob=prob)

# distribuição de probabilidade acumulada até q
pbinom(q=3, size=size, prob=prob)

# quantil (ou valor) de x correspondente à probabilidade p
qbinom(p=0.25, size=size, prob=prob)

# gerar uma amostra aleatória de tamanho n da distribuição
rbinom(n=10, size=size, prob=prob)


# Grafico da distribuição de probabilidades (ou densidade de probabilidade)
size=20
prob=0.5
barplot(height = dbinom(0:size, size=20, p=prob),
        names.arg = 0:size,
        main = "Densidade de probabilidade Binomial", 
        xlab = 'X', ylab = 'Probabilidade')


# Grafico da função de distribuição acumulada (FDA)
size=20
prob=0.5
plot(0:size, pbinom(0:size, size = size, prob = prob),
     type = "s",                            # tipo escada
     main = "Distribuição acumulada da Binomial",
     xlab = "X", ylab = "Probabilidade acumulada",
     col = "blue", lwd = 2)
grid()

#== Verificar esperança e variância da binomial ==#

# valores teóricos da distribuição:
mean_bin = size*prob; mean_bin
var_bin = size*prob*(1-prob); var_bin

#gerar uma amostra (vetor) com muitas repetições
vet = rbinom(n=10000, size=size, prob=prob)


# gráfico da 
barplot(table(vet), main = "Distribuição da amostra Binomial aleatória", 
        xlab = 'X', ylab = 'Contagem')

mean(vet)
var(vet)






###==================================###
### === DISTRIBUICAO GEOMETRICA === ###
###=================================###

prob=0.4

# calculo de probabilidade (ou densidade de probabilidade)
dgeom(x=2, prob=prob)

# distribuição de probabilidade acumulada até q
pgeom(q=4, prob=prob)

# quantil (ou valor) de x correspondente à probabilidade p
qgeom(p=0.9, prob=prob)

# gerar uma amostra aleatória de tamanho n da distribuição
rgeom(n=10, prob=prob)


# Grafico da distribuição de probabilidades (ou densidade de probabilidade)
xx=20
barplot(height = dgeom(0:xx, prob=0.1),
        names.arg = 0:xx,
        main = "Densidade de probabilidade Geométrica", 
        xlab = 'X', ylab = 'Probabilidade')


# Grafico da distribuição acumulada
xx=20
plot(0:xx, pgeom(0:xx, prob = prob),
     type = "s",                            # gráfico em degraus
     main = "Distribuição acumulada da Geométrica",
     xlab = "X", ylab = "Probabilidade acumulada",
     col = "blue", lwd = 2)
grid()



#== Verificar esperança e variância da geométrica ==#

# valores teóricos da distribuição:
mean_geom = (1-prob)/prob; mean_geom
var_geom = (1-prob)/(prob^2); var_geom

#gerar uma amostra (vetor) com muitas repetições
vet = rgeom(n=1000,  prob=prob)

barplot(table(vet), main = "Distribuição da amostra Geométrica aleatória", 
        xlab = 'X', ylab = 'Contagem')

mean(vet)
var(vet)






###===============================###
### === DISTRIBUICAO POISSON === ###
###===============================###

lambda=3

# calculo de probabilidade (ou densidade de probabilidade)
dpois(x=1, lambda=lambda)

# distribuição de probabilidade acumulada até q
ppois(q=1, lambda=lambda)

# quantil (ou valor) de x correspondente à probabilidade p
qpois(p=0.9, lambda=lambda)

# gerar uma amostra aleatória de tamanho n da distribuição
rpois(n=10, lambda=lambda)


# Grafico da distribuição de probabilidades (ou densidade de probabilidade)
xx=10
lambda=3
barplot(height = dpois(0:xx, lambda=lambda),
        names.arg = 0:xx,
        main = "Densidade de probabilidade Poison", 
        xlab = 'X', ylab = 'Probabilidade')


# Grafico da distribuição acumulada
xx=10
lambda=3
plot(0:xx, ppois(0:xx, lambda = lambda),
     type = "s",                            # gráfico em degraus
     main = "Distribuição acumulada da Poisson",
     xlab = "X", ylab = "Probabilidade acumulada",
     col = "blue", lwd = 2)
grid()




#== Verificar esperança e variância da Poison ==#

# valores teóricos da distribuição:
mean_pois = lambda; mean_pois
var_pois = lambda; var_pois

#gerar uma amostra (vetor) com muitas repetições
vet = rpois(n=1000, lambda=lambda)

barplot(table(vet), main = "Distribuição da amostra Poison aleatória", 
        xlab = 'X', ylab = 'Contagem')

mean(vet)
var(vet)






###=========================================###
### === DISTRIBUICAO BINOMIAL NEGATIVA === ###
###========================================###

size=3
prob=0.5

# calculo de probabilidade (ou densidade de probabilidade)
#Obs.: x aqui é o número de fracassos antes do k-ésimo sucesso
dnbinom(x=10-size, size=size, prob=prob)

# distribuição de probabilidade acumulada até q
pnbinom(q=1, size=size, prob=prob)

# quantil (ou valor) de x correspondente à probabilidade p
qnbinom(p=0.25, size=size, prob=prob)

# gerar uma amostra aleatória de tamanho n da distribuição
rnbinom(n=10, size=size, prob=prob)


# Grafico da distribuição de probabilidades (ou densidade de probabilidade)
xx=10
size=3
prob=0.5
barplot(height = dnbinom(0:(xx-size), size=size, p=prob),
        names.arg = 0:(xx-size),
        main = "Densidade de probabilidade Binomial Negativa", 
        xlab = 'X', ylab = 'Probabilidade')


# Grafico da distribuição acumulada
xx=10
size=3
prob=0.5
plot(0:(xx-size), pnbinom(0:(xx-size), size = size, prob = prob),
     type = "s",                            # gráfico em degraus
     main = "Distribuição acumulada da Binomial Negativa",
     xlab = "X", ylab = "Probabilidade acumulada",
     col = "blue", lwd = 2)
grid()




#== Verificar esperança e variância da binomial-negativa ==#

# valores teóricos da distribuição:
mean_nbin = size*(1-prob)/prob; mean_nbin
var_nbin = (size)*(1-prob)/(prob^2); var_nbin

#gerar uma amostra (vetor) com muitas repetições
vet = rnbinom(n=10000, size=size, prob=prob)

barplot(table(vet), main = "Distribuição da amostra Binomial Negativa aleatória", 
        xlab = 'X', ylab = 'Contagem')

mean(vet)
var(vet)




###=======================================###
### === DISTRIBUICAO HIPERGEOMETRICA === ###
###======================================###

s_pop = 6
f_pop = 44
n_pop = s_pop + f_pop; n_pop

n_amostra = 5

# calculo de probabilidade (ou densidade de probabilidade)
dhyper(x=1, m=s_pop, n=f_pop, k=n_amostra)

# distribuição de probabilidade acumulada até q
phyper(q=1, m=s_pop, n=f_pop, k=n_amostra)

# quantil (ou valor) de x correspondente à probabilidade p
qhyper(p=0.9, m=s_pop, n=f_pop, k=n_amostra)

# gerar uma amostra aleatória de tamanho n da distribuição
rhyper(nn=10, m=s_pop, n=f_pop, k=n_amostra)


# Grafico da distribuição de probabilidades (ou densidade de probabilidade)
xx=6
s_pop = 6
f_pop = 44
n_pop = s_pop + f_pop; n_pop
n_amostra = 5
barplot(height = dhyper(0:xx, m=s_pop, n=f_pop, k=n_amostra),
        names.arg = 0:xx,
        main = "Densidade de probabilidade Hipergeométrica", 
        xlab = 'X', ylab = 'Probabilidade')


# Grafico da distribuição acumulada
xx=6
s_pop = 6
f_pop = 44
n_pop = s_pop + f_pop; n_pop
n_amostra = 5

plot(0:xx, phyper(0:xx, m = s_pop, n = f_pop, k = n_amostra),
     type = "s",
     main = "Distribuição acumulada da Hipergeométrica",
     xlab = "X", ylab = "Probabilidade acumulada",
     col = "blue", lwd = 2)
grid()


#== Verificar esperança e variância da hipergeométrica ==#

# valores teóricos da distribuição:
mean_hyper = n_amostra*s_pop/n_pop; mean_hyper
var_hyper = n_amostra*(s_pop/n_pop)*(1-s_pop/n_pop)*((n_pop-n_amostra)/(n_pop-1)); var_hyper

#gerar uma amostra (vetor) com muitas repetições
vet = rhyper(nn=10000, m=s_pop, n=f_pop, k=n_amostra)

barplot(table(vet), main = "Distribuição da amostra Hipergeométrica aleatória", 
        xlab = 'X', ylab = 'Contagem')

mean(vet)
var(vet)


















