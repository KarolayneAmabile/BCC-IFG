###=============================================###
### === ATIVIDADE - INTRODUCAO A PROBABILIDADE === ###
###=============================================###


###=================###
### === EXERCICIO 1 === ###
###=================###

# Exerc´ıcio 1. Sejam A e B dois eventos em um dado espa¸co amostral, tais que P(A) = 0.2,
# P(B) = p, P(A ∪ B) = 0.5 e P(A ∩ B) = 0.1. Determine o valor de p

# Dados:
# P(A) = 0.2, P(B) = p, P(A U B) = 0.5, P(A ∩ B) = 0.1
#
# Fórmula da união: P(A U B) = P(A) + P(B) - P(A ∩ B)
# Isolando P(B): P(B) = P(A U B) - P(A) + P(A ∩ B)

P_A       <- 0.2
P_AunB    <- 0.5
P_AintB   <- 0.1

P_B <- P_AunB - P_A + P_AintB
P_B
# Resultado: p = 0.4


###=================###
### === EXERCICIO 2 === ###
###=================###

# Numa caixa h´a 30 bolas brancas, 15 pretas e 9 azuis. Retirando-se uma bola
# dessa caixa, determinar a probabilidade de que a cor dessa bola:
# Caixa com 30 brancas, 15 pretas e 9 azuis = 54 bolas no total

brancas <- 30
pretas  <- 15
azuis   <- 9
total   <- brancas + pretas + azuis; total

# (a) Probabilidade de sair bola branca
p_branca <- brancas / total
p_branca
# Resultado: ~0.556 (5/9)

# (b) Probabilidade de sair branca OU azul
# Eventos mutuamente exclusivos: basta somar
p_branca_ou_azul <- (brancas + azuis) / total
p_branca_ou_azul
# Resultado: ~0.722 (13/18)

# (c) Probabilidade de NÃO sair azul
# Complemento: 1 - P(azul)
p_nao_azul <- 1 - (azuis / total)
p_nao_azul
# Resultado: ~0.833 (5/6)

###=================###
### === EXERCICIO 3 === ###
###=================###

# Em uma prova ca´ıram dois problemas. Sabe-se que 132 alunos acertaram o
# primeiro, 86 erraram o segundo, 120 acertaram os dois e 54 acertaram apenas um problema.
# Qual a probabilidade de que um aluno, escolhido ao acaso:

# Dados sobre acertos em prova de 2 problemas:
# - 132 acertaram o primeiro
# - 86 erraram o segundo  -> 248 - 86 = 162 acertaram o segundo
# - 120 acertaram os dois (interseção)
# - 54 acertaram apenas um

# Para descobrir o total de alunos:
# Quem acertou apenas o 1º: 132 - 120 = 12
# Quem acertou apenas o 2º: 54 - 12 = 42 (pois apenas um = 54, e apenas 1º = 12)
# Total que acertou ao menos um: apenas_1 + apenas_2 + os_dois

acertaram_1   <- 132
erraram_2     <- 86
acertaram_2_2 <- 120   # acertaram os dois
apenas_um     <- 54

# Apenas o primeiro problema
apenas_1 <- acertaram_1 - acertaram_2_2
apenas_1  # 12 alunos

# Apenas o segundo problema
apenas_2 <- apenas_um - apenas_1
apenas_2  # 42 alunos

# Total de alunos na prova
total_alunos <- apenas_1 + apenas_2 + acertaram_2_2 + (erraram_2 - apenas_2)
# Forma mais direta: quem errou o 2º = erraram_2 = 86
# dentre esses, quem acertou o 1º (apenas_1 = 12) e quem não acertou nenhum
# Total = acertou pelo menos 1 + não acertou nenhum
# Usando: total = apenas_1 + apenas_2 + os_dois + nenhum

# Sabemos que 86 erraram o segundo.
# Erraram o segundo = nenhum + apenas_1 = nenhum + 12
nenhum <- erraram_2 - apenas_1
nenhum  # 74 alunos não acertaram nenhum

total_alunos <- apenas_1 + apenas_2 + acertaram_2_2 + nenhum
total_alunos  # 248 alunos

# (a) Probabilidade de não ter acertado nenhum
p_nenhum <- nenhum / total_alunos
p_nenhum
# Resultado: 74/248 ≈ 0.298

# (b) Probabilidade de ter acertado apenas o segundo
p_apenas_2 <- apenas_2 / total_alunos
p_apenas_2
# Resultado: 42/248 ≈ 0.169


###=================###
### === EXERCICIO 4 === ###
###=================###

# Seleciona-se cinco cartas de um baralho ao acaso e sem reposi¸c˜ao. Qual ´e a
# probabilidade de tirar 5 cartas de espadas?

# Baralho com 52 cartas, sendo 13 de espadas
# Retiramos 5 cartas SEM reposição
# Queremos as 5 sendo espadas

# Número de maneiras de escolher 5 espadas dentre 13: C(13,5)
# Número de maneiras de escolher 5 cartas quaisquer dentre 52: C(52,5)

favoraveis <- choose(13, 5)   # combinações de 5 espadas
possiveis  <- choose(52, 5)   # combinações de 5 cartas quaisquer

favoraveis  # 1287
possiveis   # 2598960

p_5_espadas <- favoraveis / possiveis
p_5_espadas
# Resultado: ≈ 0.000495 (muito baixo, como esperado)


###=================###
### === EXERCICIO 5 === ###
###=================###

# De um grupo de 12 homens e 8 mulheres, retiram-se 4 pessoas para formar uma
# comiss˜ao. Qual a probabilidade de:

# Grupo: 12 homens e 8 mulheres = 20 pessoas no total
# Comissão de 4 pessoas

homens   <- 12
mulheres <- 8
total    <- homens + mulheres

# Total de formas de escolher 4 pessoas de 20
total_combinacoes <- choose(total, 4)
total_combinacoes  # 4845

# (a) Probabilidade de pelo menos uma mulher
# Complemento: 1 - P(nenhuma mulher)
apenas_homens <- choose(homens, 4)   # todas as 4 são homens
p_pelo_menos_1_mulher <- 1 - (apenas_homens / total_combinacoes)
p_pelo_menos_1_mulher
# Resultado: ≈ 0.8978

# (b) Probabilidade de exatamente uma mulher
# 1 mulher de 8 * 3 homens de 12
exatamente_1_mulher <- choose(mulheres, 1) * choose(homens, 3)
p_exatamente_1_mulher <- exatamente_1_mulher / total_combinacoes
p_exatamente_1_mulher
# Resultado: ≈ 0.3632

# (c) Probabilidade de haver pessoas dos dois sexos
# Complemento: 1 - P(só homens) - P(só mulheres)
so_mulheres <- choose(mulheres, 4)
p_dois_sexos <- 1 - (apenas_homens / total_combinacoes) - (so_mulheres / total_combinacoes)
p_dois_sexos
# Resultado: ≈ 0.8834


###=================###
### === EXERCICIO 6 === ###
###=================###

# Uma universidade tem 10 mil alunos dos quais 4 mil s˜ao considerados esportistas.
# Temos, ainda, que 500 alunos d˜ao do curso de Computa¸c˜ao diurno, 700 da Computa¸c˜ao noturno,
# 100 s˜ao esportistas e da Computa¸c˜ao diurno e 200 s˜ao esportistas e da Computa¸c˜ao noturno.
# Um aluno ´e escolhido ao acaso. Calcule a probabilidade desse aluno:

# Universidade com 10.000 alunos
total_alunos     <- 10000
esportistas      <- 4000
comp_diurno      <- 500
comp_noturno     <- 700
esp_comp_diurno  <- 100
esp_comp_noturno <- 200

# Total de alunos de Computação (diurno + noturno, sem sobreposição assumida)
computacao <- comp_diurno + comp_noturno  # 1200

# Total de esportistas em Computação
esp_computacao <- esp_comp_diurno + esp_comp_noturno  # 300

# (a) Probabilidade de ser esportista
p_esportista <- esportistas / total_alunos
p_esportista  # 0.40 = 40%

# (b) Probabilidade de ser esportista E de Computação
p_esp_e_comp <- esp_computacao / total_alunos
p_esp_e_comp  # 0.03 = 3%

# (c) Probabilidade de NÃO ser de Computação
p_nao_comp <- 1 - (computacao / total_alunos)
p_nao_comp  # 0.88 = 88%

# (d) Probabilidade de ser esportista OU de Computação
# P(A U B) = P(A) + P(B) - P(A ∩ B)
p_esp_ou_comp <- (esportistas/total_alunos) + (computacao/total_alunos) - (esp_computacao/total_alunos)
p_esp_ou_comp  # 0.49 = 49%

# (e) Probabilidade de NÃO ser esportista NEM de Computação
# Complemento do item (d)
p_nem_esp_nem_comp <- 1 - p_esp_ou_comp
p_nem_esp_nem_comp  # 0.51 = 51%


###=================###
### === EXERCICIO 7 === ###
###=================###

# Dois processadores tipos A e B s˜ao colocados em teste por 50 mil horas. A
# probabilidade de que um erro de c´alculo aconte¸ca em um processador do tipo A ´e de 1/30, no
# tipo B ´e 1/80 e, em ambos, 1/1000. Qual a probabilidade de que:

# Processadores A e B em teste
# P(erro em A) = 1/30
# P(erro em B) = 1/80
# P(erro em A e B) = 1/1000

P_A <- 1/30
P_B <- 1/80
P_AeB <- 1/1000

# (a) Probabilidade de PELO MENOS UM ter apresentado erro
# P(A U B) = P(A) + P(B) - P(A ∩ B)
p_pelo_menos_um <- P_A + P_B - P_AeB
p_pelo_menos_um
# Resultado: ≈ 0.045

# (b) Probabilidade de NENHUM ter apresentado erro
# Complemento do item (a)
p_nenhum_erro <- 1 - p_pelo_menos_um
p_nenhum_erro
# Resultado: ≈ 0.955

# (c) Probabilidade de APENAS A ter apresentado erro
# P(A ocorreu) - P(A e B ocorreram)
p_apenas_A <- P_A - P_AeB
p_apenas_A
# Resultado: ≈ 0.033