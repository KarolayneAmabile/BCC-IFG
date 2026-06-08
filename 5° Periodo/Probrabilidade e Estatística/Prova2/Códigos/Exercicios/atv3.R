###===========================================###
### === ATIVIDADE - VARIÁVEIS ALEATÓRIAS === ###
###===========================================###


###=================###
### === EXERCICIO 1 === ###
###=================###

# Uma urna tem 4 bolas brancas e 3 bolas pretas. Retiram-se 3 bolas sem reposi¸c˜ao.
# Seja a v.a. X: n´umero de bolas brancas retiradas, determine:

# Urna: 4 bolas brancas e 3 pretas. Retiramos 3 sem reposição.
# X = número de bolas brancas retiradas -> X pode ser 0, 1, 2 ou 3

brancas <- 4
pretas  <- 3
total   <- brancas + pretas  # 7
n       <- 3  # bolas retiradas

# (a) Distribuição de probabilidade de X
# P(X = x) = C(4,x) * C(3, 3-x) / C(7,3)
# (hipergeométrica: x brancas de 4, e (3-x) pretas de 3)

x_vals <- 0:3

p_x <- dhyper(x = x_vals, m = brancas, n = pretas, k = n)

dist_prob <- data.frame(x = x_vals, P_X = p_x)
dist_prob
# Cada linha mostra: quantas brancas saíram e com qual probabilidade

# (b) Função de distribuição acumulada F(x)
F_x <- cumsum(p_x)  # soma acumulada das probabilidades

fda <- data.frame(x = x_vals, F_X = F_x)
fda

# Gráfico da FDA (função escada, típica de v.a. discreta)
plot(x_vals, F_x,
     type = "s",
     main = "F.D.A. - Número de bolas brancas",
     xlab = "x", ylab = "F(x)",
     col = "blue", lwd = 2,
     ylim = c(0, 1))
grid()

# (c) Esperança de X: E(X) = soma de x * P(X=x)
E_X <- sum(x_vals * p_x)
E_X  # 12/7 ≈ 1.714
# Interpretação: em média, esperamos retirar cerca de 1.7 bolas brancas

# Valor teórico da hipergeométrica: E(X) = n * m / N
E_X_teo <- n * brancas / total
E_X_teo  # confirma 12/7

# (d) Variância de X: Var(X) = E(X²) - [E(X)]²
E_X2 <- sum(x_vals^2 * p_x)
Var_X <- E_X2 - E_X^2
Var_X  # 24/49 ≈ 0.490

# Valor teórico da hipergeométrica
Var_X_teo <- n * (brancas/total) * (pretas/total) * ((total - n)/(total - 1))
Var_X_teo  # confirma 24/49


###=================###
### === EXERCICIO 2 === ###
###=================###

# um ca¸ca-n´ıquel tem dois discos que funcionam de forma independente um do
# outro. Cada disco tem 10 figuras: 4 ma¸c˜as, 3 bananas, 2 peras e 1 laranja. Uma pessoa paga
# R$ 80,00 e aciona a m´aquina. Se aparecerem duas ma¸c˜as, ganha R$ 40,00; se aparecerem duas
# bananas, ganha R$ 80,00; R$ 140,00 se aparecerem duas peras e ganha R$ 180,00 se aparecerem
# duas laranjas. Qual a esperan¸ca de ganho em uma ´unica jogada?
  

# Caça-níquel: 2 discos independentes, cada um com 10 figuras
# 4 maçãs, 3 bananas, 2 peras, 1 laranja
# Custo da jogada: R$ 80

custo <- 80

# Probabilidade de cada par (discos independentes: multiplica as probabilidades)
p_2_macas   <- (4/10) * (4/10)  # 16/100
p_2_bananas <- (3/10) * (3/10)  #  9/100
p_2_peras   <- (2/10) * (2/10)  #  4/100
p_2_laranjas<- (1/10) * (1/10)  #  1/100

# Ganhos brutos (o que a máquina paga)
ganho_macas   <- 40
ganho_bananas <- 80
ganho_peras   <- 140
ganho_laranjas<- 180

# Ganho líquido = ganho bruto - custo da jogada
# (se não ganhar nada, perde os R$80)
ganho_liq_macas    <- ganho_macas   - custo  # -40
ganho_liq_bananas  <- ganho_bananas - custo  #   0
ganho_liq_peras    <- ganho_peras   - custo  #  60
ganho_liq_laranjas <- ganho_laranjas- custo  # 100
ganho_liq_nada     <- 0 - custo              # -80

p_nada <- 1 - (p_2_macas + p_2_bananas + p_2_peras + p_2_laranjas)

# Esperança do ganho líquido
E_ganho <- ganho_liq_macas   * p_2_macas   +
  ganho_liq_bananas * p_2_bananas +
  ganho_liq_peras   * p_2_peras   +
  ganho_liq_laranjas* p_2_laranjas+
  ganho_liq_nada    * p_nada

E_ganho  # -59
# Interpretação: em média, o jogador PERDE R$59 por jogada.
# A máquina é lucrativa para o cassino.


###=================###
### === EXERCICIO 3 === ###
###=================###

# O diˆametro X de um cabo el´etrico ´e uma v.a. cont´ınua com f.d.p. dada por:


# f(x) = k*(2x - x²) para 0 ≤ x ≤ 1
# Usamos integrate() para calcular as integrais numericamente

# (a) Encontrar k tal que a integral de f(x) de 0 a 1 seja igual a 1
# integral de (2x - x²) de 0 a 1 = [x² - x³/3] de 0 a 1 = 1 - 1/3 = 2/3
# Logo k * (2/3) = 1 => k = 3/2

integral_sem_k <- integrate(function(x) 2*x - x^2, lower = 0, upper = 1)$value
k <- 1 / integral_sem_k
k  # 3/2 = 1.5

# Definindo a f.d.p. com k já encontrado
fdp <- function(x) k * (2*x - x^2)

# (b) Esperança e Variância
# E(X) = integral de x * f(x)
E_X <- integrate(function(x) x * fdp(x), lower = 0, upper = 1)$value
E_X  # 5/8 = 0.625

# E(X²) = integral de x² * f(x)
E_X2 <- integrate(function(x) x^2 * fdp(x), lower = 0, upper = 1)$value

# Var(X) = E(X²) - [E(X)]²
Var_X <- E_X2 - E_X^2
Var_X  # 19/320 ≈ 0.0594

# (c) P(0 ≤ X ≤ 1/2)
p_0_a_meio <- integrate(fdp, lower = 0, upper = 0.5)$value
p_0_a_meio  # 5/16 = 0.3125


###=================###
### === EXERCICIO 4 === ###
###=================###

# A vari´avel aleat´oria X tem f.d.p. dada pelo gr´afico abaixo. Determinar:

# Pelo gráfico: f(x) é uma reta decrescente de x=0 a x=4, com f(0) = 1/2 e f(4) = 0
# Equação da reta: f(x) = (1/2) - (1/8)*x = (4 - x) / 8

fdp4 <- function(x) (4 - x) / 8

# Verificando que integra 1 no suporte [0, 4]
integrate(fdp4, lower = 0, upper = 4)$value  # deve ser 1

# (a) P(X > 2)
p_maior_2 <- integrate(fdp4, lower = 2, upper = 4)$value
p_maior_2  # 1/4 = 0.25

# (b) m tal que P(X > m) = 1/8
# P(X > m) = integral de m a 4 de (4-x)/8 = 1/8
# [(4x - x²/2)/8] de m a 4 = 1/8
# Resolvendo numericamente: buscar m onde P(X > m) = 1/8

# Função que retorna P(X > m) - 1/8
objetivo <- function(m) integrate(fdp4, lower = m, upper = 4)$value - 1/8

m_sol <- uniroot(objetivo, interval = c(0, 4))$root
m_sol  # ≈ 2.586 (gabarito: 2.58)

# (c) Esperança E(X)
E_X4 <- integrate(function(x) x * fdp4(x), lower = 0, upper = 4)$value
E_X4  # 4/3 ≈ 1.333

# (d) Variância Var(X)
E_X2_4 <- integrate(function(x) x^2 * fdp4(x), lower = 0, upper = 4)$value
Var_X4 <- E_X2_4 - E_X4^2
Var_X4  # 8/9 ≈ 0.889

# (e) F(x): função de distribuição acumulada
# F(x) = integral de 0 a x de (4-t)/8 dt = (4x - x²/2) / 8 = x/2 - x²/16

F_x4 <- function(x) {
  ifelse(x < 0, 0,
         ifelse(x > 4, 1,
                x/2 - x^2/16))
}

# Gráfico da FDA
x_seq <- seq(-0.5, 4.5, length.out = 200)

plot(x_seq, F_x4(x_seq),
     type = "l",
     main = "F.D.A. - Exercício 4",
     xlab = "x", ylab = "F(x)",
     col = "blue", lwd = 2,
     ylim = c(0, 1))
grid()