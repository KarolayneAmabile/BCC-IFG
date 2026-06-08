###=================================================###
### === ATIVIDADE - PROBABILIDADE CONDICIONAL === ###
###=================================================###


###=================###
### === EXERCICIO 1 === ###
###=================###

# Considere dois eventos A e B, mutuamente exclusivos, com P(A) = 0.3 e P(B) =
#   0.5. Calcule:

# A e B são MUTUAMENTE EXCLUSIVOS: não podem ocorrer ao mesmo tempo
# Isso significa que P(A ∩ B) = 0

P_A <- 0.3
P_B <- 0.5

# (a) P(A ∩ B): mutuamente exclusivos => interseção é impossível
P_AintB <- 0
P_AintB  # 0

# (b) P(A ∪ B) = P(A) + P(B) - P(A ∩ B)
P_AunB <- P_A + P_B - P_AintB
P_AunB  # 0.8

# (c) P(A | B) = P(A ∩ B) / P(B)
# Como A e B são mutuamente exclusivos, se B ocorreu, A não pode ter ocorrido
P_A_dado_B <- P_AintB / P_B
P_A_dado_B  # 0

# (d) P(Ā): complemento de A
P_Acomp <- 1 - P_A
P_Acomp  # 0.7

# (e) P(A ∪ B) com barra = complemento de (A ∪ B)
P_AunB_comp <- 1 - P_AunB
P_AunB_comp  # 0.2


###=================###
### === EXERCICIO 2 === ###
###=================###

# Verifique se s˜ao v´alidas as afirma¸c˜oes:
# (a) Se P(A) = 1/3 e P(A | B) = 3/5, ent˜ao A e B n˜ao podem ser disjuntos.
# (b) Se P(A) = 1/2, P(B | A) = 1 e P(A | B) = 1/2 ent˜ao A n˜ao pode estar contido em B.

# (a) Se P(A) = 1/3 e P(A|B) = 3/5, A e B podem ser disjuntos?
# Se fossem disjuntos, P(A|B) = 0. Mas P(A|B) = 3/5 ≠ 0, logo NÃO são disjuntos.
P_A_2a     <- 1/3
P_A_dado_B <- 3/5

# Verificação: disjuntos exigiriam P(A|B) = 0
cat("P(A|B) =", P_A_dado_B, "-> Se fosse disjunto, seria 0. Afirmação VERDADEIRA.\n")

# (b) P(A) = 1/2, P(B|A) = 1, P(A|B) = 1/2 → A NÃO pode estar contido em B?
# P(B|A) = 1 significa que sempre que A ocorre, B também ocorre → A ⊆ B
# Se A ⊆ B, então P(A ∩ B) = P(A), e P(A|B) = P(A)/P(B)
# Com P(A|B) = 1/2 e P(A) = 1/2: P(B) = P(A)/P(A|B) = (1/2)/(1/2) = 1
P_A_2b     <- 1/2
P_B_dado_A <- 1
P_A_dado_B <- 1/2

P_B_2b <- P_A_2b / P_A_dado_B
cat("P(B) calculado =", P_B_2b, "\n")
# P(B) = 1 é válido (evento certo). Portanto A PODE estar contido em B.
# A afirmação "A não pode estar contido em B" é FALSA.


###=================###
### === EXERCICIO 3 === ###
###=================###

# Refazer os exerc´ıcios 4 e 5 da lista anterior utilizando agora o Teorema do Produto.

# Refazer Ex. 4 e 5 da lista anterior com o Teorema do Produto
# P(A ∩ B) = P(A) * P(B|A)  =>  P(escolhas) = produto das probabilidades condicionais

# --- Exercício 4 da lista anterior: 5 cartas de espadas ---
# Tiramos 5 cartas sem reposição. A cada retirada, o baralho diminui.
# P(1ª espada) = 13/52
# P(2ª espada | 1ª foi espada) = 12/51  ... e assim por diante

p_5_espadas <- (13/52) * (12/51) * (11/50) * (10/49) * (9/48)
p_5_espadas  # ≈ 0.000495  (igual a 1287/2598960)

# --- Exercício 5 da lista anterior: comissão de 4 pessoas (12H + 8M = 20) ---

total <- 20
homens <- 12
mulheres <- 8

# (a) Pelo menos uma mulher = 1 - P(nenhuma mulher)
# P(nenhuma mulher) pelo Teorema do Produto:
p_so_homens <- (12/20) * (11/19) * (10/18) * (9/17)
p_pelo_menos_1_mulher <- 1 - p_so_homens
p_pelo_menos_1_mulher  # ≈ 0.8978

# (b) Exatamente 1 mulher — há C(4,1)=4 posições possíveis para a mulher
# (qual das 4 posições é ocupada pela mulher)
p_exatamente_1M_ordenado <- (8/20) * (12/19) * (11/18) * (10/17)
p_exatamente_1_mulher <- choose(4, 1) * p_exatamente_1M_ordenado
p_exatamente_1_mulher  # ≈ 0.3632

# (c) Pessoas dos dois sexos = 1 - P(só homens) - P(só mulheres)
p_so_mulheres <- (8/20) * (7/19) * (6/18) * (5/17)
p_dois_sexos <- 1 - p_so_homens - p_so_mulheres
p_dois_sexos  # ≈ 0.8834


###=================###
### === EXERCICIO 4 === ###
###=================###

# A tabela a seguir apresenta dados dos 1000 ingressantes de uma universidade,
# com informa¸c˜oes sobre ´area de estudo e classe s´ocio econˆomica.

# Tabela de 1000 ingressantes: área x classe socioeconômica
# Montando a tabela como matriz

tabela <- matrix(
  c(120, 156, 68,   # Exatas:     Alta, Média, Baixa
    72,  85, 112,   # Humanas:    Alta, Média, Baixa
    169, 145,  73), # Biológicas: Alta, Média, Baixa
  nrow = 3, byrow = TRUE,
  dimnames = list(
    c("Exatas", "Humanas", "Biologicas"),
    c("Alta", "Media", "Baixa")
  )
)

tabela
total <- sum(tabela); total  # 1000 alunos

# (a) Probabilidade de ser da classe Alta
p_alta <- sum(tabela[, "Alta"]) / total
p_alta  # ≈ 0.361 = 36.1%

# (b) Probabilidade de estudar em Exatas
p_exatas <- sum(tabela["Exatas", ]) / total
p_exatas  # ≈ 0.344 = 34.4%
# Obs: o gabarito indica 33.4% -> revisando: 120+156+68 = 344 -> 34.4%
# (pode haver erro de digitação no gabarito original)

# (c) P(Humanas | Classe Média) = P(Humanas E Média) / P(Média)
total_media   <- sum(tabela[, "Media"])
p_hum_dado_media <- tabela["Humanas", "Media"] / total_media
p_hum_dado_media  # ≈ 0.220 = 22%

# (d) P(Classe Baixa | Biológicas) = P(Baixa E Bio) / P(Bio)
total_bio <- sum(tabela["Biologicas", ])
p_baixa_dado_bio <- tabela["Biologicas", "Baixa"] / total_bio
p_baixa_dado_bio  # ≈ 0.189 = 18.9%


###=================###
### === EXERCICIO 5 === ###
###=================###

# Em um teste de m´ultipla escolha, a probabilidade do aluno saber a resposta ´e
# p. Havendo m escolhas, se ele sabe a resposta ele responde corretamente com probabilidade 1,
# sen˜ao, ele responde corretamente com probabilidade 1/m.

# Questão de múltipla escolha com m alternativas
# P(sabe a resposta) = p
# P(acerta | sabe) = 1
# P(acerta | não sabe) = 1/m
#
# Pelo Teorema de Bayes:
# P(sabe | acertou) = P(acerta | sabe)*P(sabe) / P(acerta)
# P(acerta) = P(acerta|sabe)*p + P(acerta|não sabe)*(1-p)
#           = 1*p + (1/m)*(1-p)
#           = p + (1-p)/m

# (a) Fórmula geral como função de m e p
prob_sabe_dado_acerto <- function(m, p) {
  p_acerta <- p + (1 - p) / m
  p_sabe_dado_acerto <- (1 * p) / p_acerta
  return(p_sabe_dado_acerto)
}

# (b) m = 5, p = 1/2
prob_sabe_dado_acerto(m = 5, p = 1/2)  # 5/6 ≈ 0.833

# (c) Limite quando m → ∞ (muitas alternativas): chutar vira impossível
# P(sabe | acertou) → p / p = 1
# Verificando numericamente com m muito grande:
prob_sabe_dado_acerto(m = 1e9, p = 1/2)  # ≈ 1

# (d) Limite quando p → 0 (ninguém sabe a resposta): quem acerta foi chute
# P(sabe | acertou) → 0
prob_sabe_dado_acerto(m = 5, p = 1e-9)  # ≈ 0


###=================###
### === EXERCICIO 6 === ###
###=================###

# Jogamos um dado honesto e em seguida lan¸camos tantas moedas honestas como
# o n´umero obtido no dado.

# Lançamos um dado; o resultado indica quantas moedas lançamos.
# Queremos P(4 caras)

# P(4 caras | dado = k) = C(k,4) * (1/2)^k  para k >= 4; 0 para k < 4
# P(dado = k) = 1/6 para k = 1,...,6

# (a) Probabilidade total de 4 caras (Teorema da Probabilidade Total)
p_4caras <- 0
for (k in 1:6) {
  p_dado_k    <- 1/6
  p_caras_k   <- ifelse(k >= 4, choose(k, 4) * (1/2)^k, 0)
  p_4caras    <- p_4caras + p_dado_k * p_caras_k
}
p_4caras  # 29/384 ≈ 0.0755

# Conferindo a fração exata:
# Para k=4: C(4,4)*(1/2)^4 = 1/16
# Para k=5: C(5,4)*(1/2)^5 = 5/32
# Para k=6: C(6,4)*(1/2)^6 = 15/64
# Soma * (1/6) = (1/6)*(1/16 + 5/32 + 15/64) = 29/384
cat("Fração: 29/384 =", 29/384, "\n")

# (b) P(dado = 6 | 4 caras) — Teorema de Bayes
# P(dado=6 | 4 caras) = P(4 caras | dado=6) * P(dado=6) / P(4 caras)

p_caras_dado_6 <- choose(6, 4) * (1/2)^6  # 15/64
p_dado_6       <- 1/6

p_dado6_dado_4caras <- (p_caras_dado_6 * p_dado_6) / p_4caras
p_dado6_dado_4caras  # 15/29 ≈ 0.517


###=================###
### === EXERCICIO 7 === ###
###=================###

# Uma empresa produz o produto X em 3 f´abricas distintas, A, B e C, como segue:
#   a produ¸c˜ao de A ´e duas vezes a produ¸c˜ao de B, e a de C ´e duas vezes a de B. O produto X ´e
# armazenado em um dep´osito central. As propor¸c˜oes de produ¸c˜ao defeituosa s˜ao: 5% de A, 3%
#   de B e 4% de C. Retira-se uma unidade X do dep´osito e verifica-se que ´e defeituoso. Qual a
# probabilidade de que tenha sido fabricado por B?
  

# Fábricas A, B, C produzem o produto X
# Produção de A = 2B, Produção de C = 2B
# Total: B + 2B + 2B = 5B → proporções: B=1/5, A=2/5, C=2/5

p_fabrica <- c(A = 2/5, B = 1/5, C = 2/5)

# Taxas de defeito por fábrica
p_def_dado_fab <- c(A = 0.05, B = 0.03, C = 0.04)

# Probabilidade total de ser defeituoso (Teorema da Probabilidade Total)
p_defeituoso <- sum(p_fabrica * p_def_dado_fab)
p_defeituoso

# P(fabricado por B | defeituoso) — Teorema de Bayes
p_B_dado_def <- (p_fabrica["B"] * p_def_dado_fab["B"]) / p_defeituoso
p_B_dado_def  # 1/7 ≈ 0.143