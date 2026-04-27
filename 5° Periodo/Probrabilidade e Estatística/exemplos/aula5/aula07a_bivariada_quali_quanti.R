############################################
#### Codigos da aula - Analise Bivariada ###
####      Qualitativa x Quantitativa    ####
############################################


## Exemplo 1 do Slide

tab = read.table("tabela_mb.csv", head=TRUE, sep=";", dec=".")
salario = tab$salario
instrucao = tab$instrucao

# a função tapply ajuda a calcular para a variavel quantitativa
# qualquer função sobre as categorias da qualitativa
# O uso é: tapply(Quantitativa, Qualitativa, Nome da função do R)

tapply(salario, instrucao, summary)

tapply(salario, instrucao, sd)

## Boxplot comparativo

boxplot(salario ~ instrucao)

## Medida de associação
var_i = tapply(salario, instrucao, var)
var_i

n_i = tapply(salario, instrucao, length)
n_i

var_bar = sum(var_i*n_i)/sum(n_i)
var_bar

var(salario)

R2 = 1 - var_bar/var(salario)
R2


## Exemplo 2 do Slide

tab = read.table("tabela_mb.csv", head=TRUE, sep=";", dec=".")
salario = tab$salario
regiao = tab$regiao

# resumo de dados

tapply(salario, regiao, summary)

tapply(salario, regiao, sd)

## Boxplot comparativo

boxplot(salario ~ regiao)

## Medida de associação
var_i = tapply(salario, regiao, var)
var_i


n_i = tapply(salario, regiao, length)
n_i

var_bar = sum(var_i*n_i)/sum(n_i)
var_bar

var(salario)


R2 = 1 - var_bar/var(salario)
R2


###########################################
## Exemplo com dados de Expectativa de vida
###########################################

tab = read.table("life_expectancy.csv", head=TRUE, sep=";", dec=",")

## comparando desenvolvimento com escolaridade

boxplot(tab$Schooling ~ tab$Economy_status_Developed)

var_i = tapply(tab$Schooling, tab$Economy_status_Developed, var); var_i
n_i = tapply(tab$Schooling, tab$Economy_status_Developed, length); n_i

var_bar = sum(n_i*var_i)/sum(n_i); var_bar

var(tab$Schooling)

1 - var_bar/var(tab$Schooling)

## comparando desenvolvimento com indice de vacianação contra Hepatite B

boxplot(tab$Hepatitis_B ~ tab$Economy_status_Developed)

var_i = tapply(tab$Hepatitis_B, tab$Economy_status_Developed, var); var_i
n_i = tapply(tab$Hepatitis_B, tab$Economy_status_Developed, length); n_i

var_bar = sum(n_i*var_i)/sum(n_i); var_bar

var(tab$Hepatitis_B)

1 - var_bar/var(tab$Hepatitis_B)




