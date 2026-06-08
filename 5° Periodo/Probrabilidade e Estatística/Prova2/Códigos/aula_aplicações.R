
###=====================###
### === Aplicação I === ###
###=====================###

set.seed(123)

n_sim <- 10000

x10  <- rbinom(n_sim, size = 10,  prob = 0.5)

hist(x10)

media1 = 10*0.5; media1
desvpad1 = sqrt(10*0.5*0.5); desvpad1

x30  <- rbinom(n_sim, size = 30,  prob = 0.5)
x100 <- rbinom(n_sim, size = 100, prob = 0.5)
x500 <- rbinom(n_sim, size = 500, prob = 0.5)


library(ggplot2)

# gerando um data frame com os valores gerados

dados <- data.frame(
  valor = c(x10, x30, x100, x500),
  grupo = factor(
    rep(c("n = 10", "n = 30", "n = 100", "n = 500"),
        each = n_sim),
    levels = c("n = 10", "n = 30", "n = 100", "n = 500")
  )
)


# Construindo os 4 gráficos

ggplot(dados, aes(x = valor)) +
  geom_histogram( binwidth = 1,
                  boundary = -0.5) +
  facet_wrap(~grupo, scales = "free") +
  labs(
    title = "Distribuição Binomial para diferentes valores de n",
    x = "Número de sucessos",
    y = "Frequência"
  ) +
  theme_minimal()




# Curvas normais teóricas

ns <- c(10, 30, 100, 500)

curvas <- do.call(rbind,
                  lapply(ns, function(n){
                    
                    x <- seq(0, n, length.out = 500)
                    
                    data.frame(
                      x = x,
                      y = dnorm(
                        x,
                        mean = n/2,
                        sd = sqrt(n/4)
                      ),
                      grupo = paste0("n = ", n)
                    )
                  }))


ggplot(dados, aes(x = valor)) +
  geom_histogram(
    aes(y = after_stat(density)),
     binwidth = 1,
  boundary = -0.5
  ) +
  geom_line(
    data = curvas,
    aes(x = x, y = y),
    linewidth = 1
  ) +
  facet_wrap(~grupo, scales = "free") +
  labs(
    title = "Distribuição Binomial e Aproximação Normal",
    x = "Número de sucessos",
    y = "Densidade"
  ) +
  theme_minimal()



# Reduzir todos os valores para a Normal Padrão (media 0 e variancia 1)

z10  <- (x10  - 10*0.5)  / sqrt(10*0.5*0.5)
z30  <- (x30  - 30*0.5)  / sqrt(30*0.5*0.5)
z100 <- (x100 - 100*0.5) / sqrt(100*0.5*0.5)
z500 <- (x500 - 500*0.5) / sqrt(500*0.5*0.5)


c(mean(z10), mean(z30), mean(z100), mean(z500))
c(sd(z10), sd(z30), sd(z100), sd(z500))

dados_z <- data.frame(
  valor = c(z10, z30, z100, z500),
  grupo = factor(
    rep(c("n = 10", "n = 30", "n = 100", "n = 500"),
        each = n_sim)
  )
)



# Comparando os dados padronizados com a distribução normal padrão
ggplot(dados_z, aes(x = valor)) +
  geom_histogram(aes(y = after_stat(density)),
                 bins = 30) +
  stat_function(fun = dnorm,
                linewidth = 1) +
  facet_wrap(~grupo) +
  labs(
    title = "Aproximação da Binomial pela Normal",
    x = "Valor padronizado",
    y = "Densidade"
  ) +
  theme_minimal()




###======================###
### === Aplicação II === ###
###======================###


set.seed(123)
# Iniciando com distribuição Normal
# Gerar uma única amostra de tamanho n da normal

n=50   #   tamanho da amostra

x <- rnorm(n=n, mean = 100, sd = 5)
mean(x)
sd(x)

hist(x,
     main = "Distribuição Original: N(100,25)",
     xlab = "Valor")

# Gerar N amostras de tamanho n da normal

set.seed(123)

N <- 10000   # número de amostras
n <- 50      # tamanho de cada amostra

medias <- replicate(
  N,
  mean(rnorm(n, mean = 100, sd = 5))
)

#medias


hist(medias,
     breaks = 30,
     main = "Distribuição das Médias Amostrais",
     xlab = "Média amostral")

mean(medias)
sd(medias)



# Agora vamos pegar uma exponencial
# Gerar uma única amostra de tamanho n da exponencial(lambda=5)

n=50   #   tamanho da amostra

x <- rexp(n=n, rate = 5)
mean(x)
sd(x)

hist(x,
     main = "Distribuição Original: Exp(5)",
     xlab = "Valor")

# Gerar N amostras de tamanho n da normal

set.seed(123)

N <- 10000   # número de amostras
n <- 50      # tamanho de cada amostra

medias <- replicate(
  N,
  mean(rexp(n, rate = 5))
)

#medias


hist(medias,
     breaks = 30,
     main = "Distribuição das Médias Amostrais",
     xlab = "Média amostral")

mean(medias)
sd(medias)

# Agora vamos pegar uma Binomial
# Gerar uma única amostra de tamanho n da Binomial(10, 0.8)

n=50   #   tamanho da amostra

x <- rbinom(n=n, size = 10, prob = 0.8)
mean(x)
sd(x)

hist(x,
     main = "Distribuição Original: Binom(10,0.8)",
     xlab = "Valor")

# Gerar N amostras de tamanho n da normal

set.seed(123)

N <- 10000   # número de amostras
n <- 50      # tamanho de cada amostra

medias <- replicate(
  N,
  mean(rbinom(n, size = 10, prob = 0.8))
)

#medias


hist(medias,
     breaks = 30,
     main = "Distribuição das Médias Amostrais",
     xlab = "Média amostral")

mean(medias)
sd(medias)







###=======================###
### === Aplicação III === ###
###=======================###


set.seed(123)

N <- 100000

x <- runif(N, min = -1, max = 1)
y <- runif(N, min = -1, max = 1)

dentro <- x^2 + y^2 <= 1


estimativa_pi <- 4 * mean(dentro)

estimativa_pi


## Gráfico
library(ggplot2)

dados <- data.frame(
  x = x,
  y = y,
  dentro = dentro
)

ggplot(dados, aes(x = x, y = y, color = dentro)) +
  geom_point(alpha = 0.5) +
  coord_fixed() +
  labs(
    title = "Estimativa de π por simulação",
    x = "x",
    y = "y",
    color = "Dentro do círculo?"
  ) +
  theme_minimal()


## Observar a convergência para o verdadeiro valor de Pi quando aumentamos N

N = 1000

x <- runif(N, min = -1, max = 1)
y <- runif(N, min = -1, max = 1)

dentro <- x^2 + y^2 <= 1

estimativas <- 4 * cumsum(dentro) / seq_along(dentro)

dados_conv <- data.frame(
  N = 1:N,
  estimativa = estimativas
)

ggplot(dados_conv, aes(x = N, y = estimativa)) +
  geom_line() +
  geom_hline(yintercept = pi, linetype = "dashed") +
  labs(
    title = "Convergência da estimativa de π",
    x = "Número de pontos simulados",
    y = "Estimativa de π"
  ) +
  theme_minimal()




###=====================###
### === Exercício I === ###
###=====================###

# Poisson
# Número médio de requisições por minuto
lambda <- 12

# Probabilidade de exatamente 12 requisições
dpois(12, lambda = lambda)

# Probabilidade de mais de 18 requisições
1 - ppois(18, lambda = lambda)

# Simulação de 10.000 minutos
set.seed(123)

N <- 10000

requisicoes <- rpois(N, lambda = lambda)

mean(requisicoes)
var(requisicoes)

hist(requisicoes,
     breaks = 30,
     main = "Número de requisições por minuto",
     xlab = "Requisições",
     ylab = "Frequência")


# Exponencial
# Taxa média: 12 requisições por minuto
lambda <- 12

# Tempo médio entre requisições, em minutos
1/lambda

# Tempo médio em segundos
(1/lambda) * 60

# Probabilidade de demorar mais de 10 segundos
# Esse 'lower.tail = FALSE' calcula a probabilidade da cauda à direita (MAIOR QUE)
pexp(10/60, rate = lambda, lower.tail = FALSE)

# Simulação dos tempos entre requisições

tempos <- rexp(10000, rate = lambda)

# Convertendo para segundos
tempos_segundos <- tempos * 60

mean(tempos_segundos)

hist(tempos_segundos,
     breaks = 40,
     main = "Tempo entre requisições",
     xlab = "Tempo em segundos",
     ylab = "Frequência")



###======================###
### === Exercício II === ###
###======================###

# X ~ Geometrica (p)
p <- 0.0001

# Probabilidade de acertar na primeira tentativa
p

# Probabilidade de acertar até 1000 tentativas
pgeom(999, prob = p)

# Número esperado de tentativas até o primeiro acerto
1/p


# Simulação
N <- 10000

# rgeom gera o número de fracassos antes do primeiro sucesso
fracassos <- rgeom(N, prob = p)

# número de tentativas até o primeiro sucesso
tentativas <- fracassos + 1

mean(tentativas)
median(tentativas)

#Histograma
hist(tentativas,
     breaks = 100,
     xlim = c(0, 50000),
     main = "Número de tentativas até acertar a senha",
     xlab = "Tentativas",
     ylab = "Frequência")




###=======================###
### === Exercício III === ###
###=======================###

# Tempo médio até falha
media <- 5000

# Taxa da distribuição exponencial
lambda <- 1/media


# Probabilidade de funcionar mais de 3000 horas
pexp(3000, rate = lambda, lower.tail = FALSE)

# Probabilidade de falhar antes de 1000 horas
pexp(1000, rate = lambda)


# Prazo de garantia para 20% de falhas
garantia <- qexp(0.2, rate = lambda)

garantia

# garantia em dias
garantia_dias <- garantia / 24

garantia_dias


# Simulação
N <- 10000

tempos <- rexp(N, rate = lambda)

# Proporção de componentes que falham dentro da garantia
mean(tempos <= garantia)

# Número esperado de trocas
sum(tempos <= garantia)



library(ggplot2)

dados <- data.frame(tempos = tempos)

ggplot(dados, aes(x = tempos)) +
  geom_histogram(aes(y = after_stat(density)),
                 bins = 50) +
  stat_function(fun = dexp,
                args = list(rate = lambda),
                linewidth = 1) +
  geom_vline(xintercept = garantia,
             linetype = "dashed",
             linewidth = 1,
             col = "red"
             ) +
  labs(
    title = "Tempo até falha e prazo de garantia",
    x = "Tempo até falha (horas)",
    y = "Densidade"
  ) +
  theme_minimal()





###======================###
### === Exercício IV === ###
###======================###

visitantes_A <- 1000
compras_A <- 85

visitantes_B <- 1000
compras_B <- 102

prop_A <- compras_A / visitantes_A; prop_A
prop_B <- compras_B / visitantes_B; prop_B

prop_B - prop_A


# Simulação de diferenças supondo que a taxa é a mesma nos dois sites

N <- 10000

p_comum <- (compras_A + compras_B) / (visitantes_A + visitantes_B)

sim_A <- rbinom(N, size = visitantes_A, prob = p_comum)
sim_B <- rbinom(N, size = visitantes_B, prob = p_comum)

dif_sim <- sim_B/visitantes_B - sim_A/visitantes_A

dif_obs <- prop_B - prop_A

mean(dif_sim >= dif_obs)


hist(dif_sim,
     breaks = 40,
     main = "Diferenças simuladas entre as taxas de conversão",
     xlab = "Diferença simulada: B - A",
     ylab = "Frequência")

abline(v = dif_obs,
       lwd = 2,
       lty = 2,
       col = "red")




###=====================###
### === Exercício V === ###
###=====================###


# Parâmetros
mu_diferentes <- 40
sd_diferentes <- 10

mu_mesma <- 80
sd_mesma <- 10

limiar <- 60

# Falso positivo:
# pessoa diferente, mas o sistema classifica como mesma pessoa
falso_positivo <- pnorm(limiar,
                        mean = mu_diferentes,
                        sd = sd_diferentes,
                        lower.tail = FALSE)

# Falso negativo:
# mesma pessoa, mas o sistema classifica como pessoa diferente
falso_negativo <- pnorm(limiar,
                        mean = mu_mesma,
                        sd = sd_mesma)

falso_positivo
falso_negativo


# Simulação

N <- 10000

pont_diferentes <- rnorm(N, mean = mu_diferentes, sd = sd_diferentes)
pont_mesma <- rnorm(N, mean = mu_mesma, sd = sd_mesma)

# Classificação
class_diferentes <- pont_diferentes > limiar
class_mesma <- pont_mesma > limiar

# Proporção de falsos positivos
mean(class_diferentes)

# Proporção de falsos negativos
mean(!class_mesma)



library(ggplot2)

dados <- data.frame(
  pontuacao = c(pont_diferentes, pont_mesma),
  grupo = rep(c("Pessoas diferentes", "Mesma pessoa"), each = N)
)

ggplot(dados, aes(x = pontuacao, fill = grupo)) +
  geom_density(alpha = 0.4) +
  geom_vline(xintercept = limiar, linetype = "dashed", linewidth = 1) +
  labs(
    title = "Pontuação de similaridade em um sistema de reconhecimento",
    x = "Pontuação de similaridade",
    y = "Densidade",
    fill = "Situação real"
  ) +
  theme_minimal()


## Comparar limiares

mu_diferentes <- 40
sd_diferentes <- 10

mu_mesma <- 80
sd_mesma <- 10

limiares <- seq(40, 90, by = 1)

erros <- data.frame(
  limiar = limiares,
  falso_positivo = pnorm(limiares,
                         mean = mu_diferentes,
                         sd = sd_diferentes,
                         lower.tail = FALSE),
  falso_negativo = pnorm(limiares,
                         mean = mu_mesma,
                         sd = sd_mesma)
)

ggplot(erros, aes(x = limiar)) +
  geom_line(aes(y = falso_positivo)) +
  geom_line(aes(y = falso_negativo), linetype = "dashed") +
  labs(
    title = "Falso positivo e falso negativo em função do limiar",
    x = "Limiar de classificação",
    y = "Probabilidade de erro"
  ) +
  theme_minimal()
