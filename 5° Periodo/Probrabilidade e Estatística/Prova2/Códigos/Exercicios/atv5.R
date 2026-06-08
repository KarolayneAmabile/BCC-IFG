###===================================================###
### === ATIVIDADE - MODELOS CONTÍNUOS             === ###
###===================================================###


###=================###
### === EXERCICIO 1 === ###
###=================###

# Uma f´abrica de tubos de TV determinou que a vida m´edia dos tubos de sua
# fabrica¸c˜ao ´e de 800 horas de uso cont´ınuo e segue uma distribui¸c˜ao exponencial. Qual a probabilidade de que a f´abrica tenha de substituir um tubo gratuitamente, se oferece garantia de
# 300 horas de uso?

# Vida dos tubos ~ Exponencial com média = 800 horas
# λ = 1/média
# A fábrica substitui gratuitamente se o tubo falhar antes de 300 horas
# Queremos: P(X < 300)

lambda <- 1/800

p_substitui <- pexp(300, rate = lambda)
p_substitui  # ≈ 0.3127
# Há ~31% de chance de o tubo falhar dentro da garantia


###=================###
### === EXERCICIO 2 === ###
###=================###

# Na leitura de uma escala, os erros variam de −1/4 a 1/4, com distribui¸c˜ao
# uniforme de probabilidade. Calcular a m´edia e a variˆancia da distribui¸c˜ao dos erros.

# Erros ~ Uniforme(-1/4, 1/4)
# Para Uniforme(a, b): média = (a+b)/2 e variância = (b-a)²/12

a <- -1/4
b <-  1/4

media_unif <- (a + b) / 2
media_unif  # 0 (erros centrados em zero, como esperado)

var_unif <- (b - a)^2 / 12
var_unif  # 1/48 ≈ 0.02083


###=================###
### === EXERCICIO 3 === ###
###=================###

# Os sal´arios dos diretores das empresas de S˜ao Paulo distribuem-se normalmente
# com m´edia de R$ 8.000,00 e desvio padr˜ao de R$ 500,00. Qual a porcentagem de diretores que
# recebem:
#   

# Salários ~ Normal(μ=8000, σ=500)

mu    <- 8000
sigma <- 500

# (a) P(X < 6470)
pnorm(6470, mean = mu, sd = sigma)  # ≈ 0.001107 = 0.11%

# (b) P(8920 < X < 9380)
pnorm(9380, mean = mu, sd = sigma) - pnorm(8920, mean = mu, sd = sigma)  # ≈ 0.02999 = 3%


###=================###
### === EXERCICIO 4 === ###
###=================###

# Numa f´abrica foram instaladas 1000 lˆampadas novas. Sabe-se que a dura¸c˜ao
# m´edia das lˆampadas ´e de 800 horas e desvio padr˜ao de 100 horas, com distribui¸c˜ao normal.
# Determinar a quantidade de lˆampadas que durar˜ao:

# Lâmpadas ~ Normal(μ=800, σ=100). Total = 1000 lâmpadas.
# Calculamos a proporção e multiplicamos por 1000.

mu    <- 800
sigma <- 100
N     <- 1000

# (a) Menos de 500 horas: P(X < 500) * 1000
p_menos_500 <- pnorm(500, mean = mu, sd = sigma)
p_menos_500 * N  # ≈ 1.4 lâmpadas

# (b) Mais de 700 horas: P(X > 700) * 1000
p_mais_700 <- pnorm(700, mean = mu, sd = sigma, lower.tail = FALSE)
p_mais_700 * N  # ≈ 841.3 lâmpadas

# (c) Entre 516 e 684 horas: P(516 < X < 684) * 1000
p_entre <- pnorm(684, mean = mu, sd = sigma) - pnorm(516, mean = mu, sd = sigma)
p_entre * N  # ≈ 120.8 lâmpadas


###=================###
### === EXERCICIO 5 === ###
###=================###

# Suponha que as amplitudes de vida de dois aparelhos el´etricos, D1 e D2, tenham
# distribui¸c˜oes N(42, 36) e N(45, 9), respectivamente. Se os aparelhos s˜ao feitos para ser usados
# por um per´ıodo de 45 horas, qual aparelho deve ser preferido? E se for por um per´ıodo de 49
# horas?

# D1 ~ N(42, 36) → μ=42, σ²=36, σ=6
# D2 ~ N(45,  9) → μ=45, σ²=9,  σ=3
# Nota: N(μ, σ²) → desvio padrão = sqrt(σ²)

# Preferimos o aparelho com MAIOR probabilidade de durar o período exigido

# Período de 45 horas: P(X ≥ 45)
p_D1_45 <- pnorm(45, mean = 42, sd = 6,  lower.tail = FALSE)
p_D2_45 <- pnorm(45, mean = 45, sd = 3,  lower.tail = FALSE)

cat("P(D1 dura 45h):", p_D1_45, "\n")  # ≈ 0.309
cat("P(D2 dura 45h):", p_D2_45, "\n")  # ≈ 0.500
# Para 45h: D2 é preferível (maior chance de sobreviver)

# Período de 49 horas: P(X ≥ 49)
p_D1_49 <- pnorm(49, mean = 42, sd = 6,  lower.tail = FALSE)
p_D2_49 <- pnorm(49, mean = 45, sd = 3,  lower.tail = FALSE)

cat("P(D1 dura 49h):", p_D1_49, "\n")  # ≈ 0.121
cat("P(D2 dura 49h):", p_D2_49, "\n")  # ≈ 0.091
# Para 49h: D1 é preferível (apesar da média menor, tem desvio maior — mais "espalhado")


###=================###
### === EXERCICIO 6 === ###
###=================###

# A f.d.p. f(x) = 
# 2e
# −2x
# se x ≥ 0
# 0 se x < 0
# representa a distribui¸c˜ao do ´ındice de acidez
# de um determinado produto aliment´ıcio. O produto ´e consum´ıvel se este ´ındice for menor que
# 2. O setor de fiscaliza¸c˜ao da ´area apreendeu 30 unidades dele. Qual a probabilidade de que
# pelo menos 10% da amostra seja impr´opria para consumo?
#   

# Índice de acidez ~ Exponencial(λ=2)
# Produto impróprio se índice ≥ 2
# Amostra de 30 unidades. Queremos P(pelo menos 3 impróprias)
# (10% de 30 = 3 unidades)

lambda_ac <- 2

# Probabilidade de UMA unidade ser imprópria: P(X ≥ 2)
p_impropria <- pexp(2, rate = lambda_ac, lower.tail = FALSE)
p_impropria  # ≈ 0.01832

# Número de impróprias em 30 ~ Binomial(30, p_impropria)
# P(Y ≥ 3) = 1 - P(Y ≤ 2)
1 - pbinom(2, size = 30, prob = p_impropria)  # ≈ 0.02172


###=================###
### === EXERCICIO 7 === ###
###=================###

# A quantidade de ´oleo contida em cada lata fabricada por uma ind´ustria tem peso
# distribu´ıdo normalmente, com m´edia de 990 g e desvio padr˜ao de 10 g. Uma lata ´e rejeitada
# no com´ercio se tiver peso menor que 976 g.
# (a) Se observarmos uma sequˆencia casual destas latas em uma linha de produ¸c˜ao, qual a
# probabilidade de que a 10ª lata observada seja a 1ª rejeitada?
#   (b) Nas condi¸c˜oes do item anterior, qual a probabilidade de que, em 20 latas observadas, 3
# sejam rejeitadas?
#   

# Peso das latas ~ Normal(μ=990, σ=10)
# Lata rejeitada se peso < 976g

mu    <- 990
sigma <- 10

# Probabilidade de uma lata ser rejeitada
p_rej <- pnorm(976, mean = mu, sd = sigma)
p_rej  # ≈ 0.08076

# (a) A 10ª lata é a 1ª rejeitada → Geométrica
# P(X = 9 fracassos antes do 1º sucesso) = (1-p)^9 * p
dgeom(9, prob = p_rej)  # ≈ 0.03785

# (b) Em 20 latas, exatamente 3 rejeitadas → Binomial
dbinom(3, size = 20, prob = p_rej)  # ≈ 0.14347


###=================###
### === EXERCICIO 8 === ###
###=================###

# O diˆametro X de um cabo de v´ıdeo ´e uma v.a. com distribui¸c˜ao normal, com
# m´edia de 21 mm e desvio padr˜ao de 1,5 mm. A probabilidade de um cabo sair com diˆametro
# fora das especifica¸c˜oes ´e p1 = 0, 691759−P(X > 23). Considerando p = p1/800 a probabilidade
# de um cabo produzido ser rejeitado, determinar a probabilidade de que, na produ¸c˜ao de 8.000
# cabos, no m´aximo 3 sejam rejeitados.

# Diâmetro X ~ Normal(μ=21, σ=1.5)
# p1 = 0.691759 - P(X > 23): probabilidade de estar fora das especificações

mu    <- 21
sigma <- 1.5

p_maior_23 <- pnorm(23, mean = mu, sd = sigma, lower.tail = FALSE)
p1 <- 0.691759 - p_maior_23
p1  # probabilidade de estar fora das especificações

# p = p1 / 800: probabilidade de um cabo ser rejeitado
p_rej <- p1 / 800
p_rej

# Produção de 8000 cabos ~ Binomial(8000, p_rej)
# n grande, p pequeno → Poisson com λ = n * p
lambda_cabos <- 8000 * p_rej

# P(X ≤ 3): no máximo 3 rejeitados
ppois(3, lambda = lambda_cabos)  # ≈ 0.1512