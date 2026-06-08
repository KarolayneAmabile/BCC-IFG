###================================================###
### === EXERCICIOS - MODELOS DISCRETOS          === ###
###================================================###


###=================###
### === EXERCICIO 1 === ###
###=================###

# X ~ Binomial(n=10, p=2/5)
# n = número de tentativas, p = probabilidade de sucesso

n <- 10
p <- 2/5

# (a) P(X = 3): probabilidade de exatamente 3 sucessos
dbinom(3, size = n, prob = p)  # ≈ 0.2149

# (b) P(X ≤ 2): probabilidade de no máximo 2 sucessos
pbinom(2, size = n, prob = p)  # ≈ 0.1673

# (c) P(3 < X ≤ 5) = P(X=4) + P(X=5) = P(X≤5) - P(X≤3)
pbinom(5, size = n, prob = p) - pbinom(3, size = n, prob = p)  # ≈ 0.4515


###=================###
### === EXERCICIO 2 === ###
###=================###

# X ~ B(300, 0.01) → aproximamos por Poisson com λ = n*p
# Quando n é grande e p é pequeno, Binomial ≈ Poisson

lambda <- 300 * 0.01  # λ = 3

# (a) P(X = 4)
dpois(4, lambda = lambda)  # ≈ 0.1680

# (b) P(X ≤ 2)
ppois(2, lambda = lambda)  # ≈ 0.1991

# (c) P(1 < X ≤ 4) = P(X≤4) - P(X≤1)
ppois(4, lambda = lambda) - ppois(1, lambda = lambda)  # ≈ 0.6161


###=================###
### === EXERCICIO 3 === ###
###=================###

# Uma urna tem 20 bolas pretas e 30 bolas brancas. Retiram-se 25 bolas com
# reposi¸c˜ao. Qual a probabilidade de que:

# Urna: 20 pretas e 30 brancas = 50 bolas. Retira 25 COM reposição.
# COM reposição → cada retirada é independente → Binomial
# p(preta) = 20/50 = 0.4

n <- 25
p_preta <- 20/50  # 0.4

# (a) P(X = 2): exatamente 2 pretas
dbinom(2, size = n, prob = p_preta)  # ≈ 0.00038

# (b) P(X ≥ 3): pelo menos 3 pretas = 1 - P(X ≤ 2)
1 - pbinom(2, size = n, prob = p_preta)  # ≈ 0.99957


###=================###
### === EXERCICIO 4 === ###
###=================###

# Numa estrada h´a 2 acidentes para cada 100 Km. Qual a probabilidade de que
# em:

# Taxa de acidentes: 2 a cada 100 km → Poisson
# λ é proporcional à distância

taxa_por_km <- 2 / 100  # 0.02 acidentes/km

# (a) Em 250 km: λ = 0.02 * 250 = 5. P(X ≥ 3) = 1 - P(X ≤ 2)
lambda_250 <- taxa_por_km * 250  # 5
1 - ppois(2, lambda = lambda_250)  # ≈ 0.8753

# (b) Em 300 km: λ = 0.02 * 300 = 6. P(X = 5)
lambda_300 <- taxa_por_km * 300  # 6
dpois(5, lambda = lambda_300)  # ≈ 0.1606


###=================###
### === EXERCICIO 5 === ###
###=================###

# Numa urna h´a 40 bolas brancas e 60 pretas. Retiram-se 20 bolas. Qual a
# probabilidade de que ocorram no m´ınimo 2 bolas brancas considerando extra¸c˜oes:
#   

# Urna: 40 brancas e 60 pretas = 100 bolas. Retira 20.
# P(X ≥ 2) = 1 - P(X ≤ 1) = 1 - P(X=0) - P(X=1)

brancas <- 40
pretas  <- 60
total   <- brancas + pretas  # 100
n       <- 20

# (a) SEM reposição → Hipergeométrica
p_hiper <- 1 - phyper(1, m = brancas, n = pretas, k = n)
p_hiper  # ≈ 0.99984

# (b) COM reposição → Binomial
p_binom <- 1 - pbinom(1, size = n, prob = brancas/total)
p_binom  # ≈ 0.99948


###=================###
### === EXERCICIO 6 === ###
###=================###

# Uma urna tem 10 bolas brancas e 40 pretas
# (a) Qual a probabilidade de que a 6ª bola retirada com reposi¸c˜ao seja a 1ª branca?
#   (b) Qual a probabilidade de que de 16 bolas retiradas sem reposi¸c˜ao ocorram 3 bolas brancas?
#   (c) Qual a probabilidade de que em 30 bolas retiradas com reposi¸c˜ao ocorram no m´aximo 2
# brancas?
#   (d) Se o n´umero de bolas fosse 50 brancas e 950 pretas, qual a probabilidade de que retirandose 200 bolas, com reposi¸c˜ao, ocorressem pelo menos 3 brancas?

# Urna: 10 brancas e 40 pretas = 50 bolas. p(branca) = 10/50 = 0.2

p_b <- 10/50  # 0.2
p_p <- 1 - p_b  # 0.8 (preta)

# (a) 6ª retirada COM reposição é a 1ª branca → Geométrica
# P(X = 5 fracassos antes do 1º sucesso) = (1-p)^5 * p
# Obs: dgeom(x, p) usa x = número de FRACASSOS antes do 1º sucesso
dgeom(5, prob = p_b)  # ≈ 0.0655

# (b) 16 retiradas SEM reposição, exatamente 3 brancas → Hipergeométrica
dhyper(3, m = 10, n = 40, k = 16)  # ≈ 0.2932

# (c) 30 retiradas COM reposição, no máximo 2 brancas → Binomial
pbinom(2, size = 30, prob = p_b)  # ≈ 0.0442

# (d) Nova urna: 50 brancas e 950 pretas = 1000. p = 50/1000 = 0.05
# 200 retiradas com reposição. P(X ≥ 3) = 1 - P(X ≤ 2)
# n grande, p pequeno → Poisson com λ = 200 * 0.05 = 10
lambda_d <- 200 * (50/1000)  # λ = 10
1 - ppois(2, lambda = lambda_d)  # ≈ 0.9972


###=================###
### === EXERCICIO 7 === ###
###=================###

# 20% dos refrigeradores produzidos por uma empresa s˜ao defeituosos. Os aparelhos
# s˜ao vendidos com lotes com 50 unidades. Um comprador adotou o seguinte procedimento:
#   de cada lote ele testa 20 aparelhos e se houver pelo menos 2 defeituosos o lote ´e rejeitado.
# Admitindo-se que o comprador tenha aceitado o lote, qual a probabilidade de ter observado
# exatamente um aparelho defeituoso?

# 20% de defeituosos. Testa 20 aparelhos. Lote rejeitado se ≥ 2 defeituosos.
# Sabemos que o comprador ACEITOU o lote → ocorreu 0 ou 1 defeituoso.
# Queremos: P(X=1 | X ≤ 1) = P(X=1) / P(X ≤ 1)

n <- 20
p_def <- 0.20

p_x1    <- dbinom(1, size = n, prob = p_def)  # P(X = 1)
p_x_le1 <- pbinom(1, size = n, prob = p_def)  # P(X ≤ 1)

# Probabilidade condicional
p_cond <- p_x1 / p_x_le1
p_cond  # ≈ 0.8333
# Dado que o lote foi aceito, há 83% de chance de ter visto exatamente 1 defeito


###=================###
### === EXERCICIO 8 === ###
###=================###

# Numa cidade ´e selecionada uma amostra de 60 adultos e a esses indiv´ıduos ´e
# pedido para opinarem se s˜ao a favor ou contra um determinado projeto. Como resultado obtido,
# observou-se 40 a favor. Se na realidade as opini˜oes pr´o e contra s˜ao igualmente divididas, qual
# ´e a probabilidade de ter obtido tal resultado?

# 60 adultos. Se opiniões são 50/50, X ~ B(60, 0.5)
# Qual a probabilidade de obter EXATAMENTE 40 a favor?

n <- 60
p <- 0.5

dbinom(40, size = n, prob = p)  # ≈ 0.00364
# Resultado bem improvável sob a hipótese de 50/50 (sugere tendência real a favor)


###=================###
### === EXERCICIO 9 === ###
###=================###

# O n´umero de part´ıculas gama emitidas por segundo, por certa substˆancia radioativa, ´e uma vari´avel aleat´oria com distribui¸c˜ao de Poison com λ = 3. Se um instrumento
# registrador torna-se inoperante quando h´a mais de 4 part´ıculas por segundo, qual ´e a probabilidade de isto acontecer em qualquer dado segundo?
#   

# Emissão de partículas gama: X ~ Poisson(λ = 3)
# Instrumento falha se X > 4

lambda <- 3

# P(X > 4) = 1 - P(X ≤ 4)
1 - ppois(4, lambda = lambda)  # ≈ 0.1847
# Há ~18.5% de chance de o instrumento ficar inoperante em qualquer segundo