## Exercıcio 1. ################################################################
## Quer se estudar o numero de erros de impressao de um livro.
## Para isso escolheu-se uma amostra de 50 paginas, encontrando-se o numero de 
## erros por pagina da tabela abaixo.
matriz <- matrix(c(0,25,
                   1,20,
                   2,3,
                   3,1,
                   4,1),
                 nrow = 5,
                 byrow = TRUE)
colnames(matriz) <- c("Erros", "Frequencia")
matriz

## (a) Qual o numero medio de erros por pagina?
media = 0
for (i in 1:nrow(matriz))
  media = media + matriz[i,1]*matriz[i,2]
media = media / sum(matriz[, 2])
media

## (b) Qual e o desvio padrao?
variancia = 0
for (i in 1:nrow(matriz))
  variancia = variancia + (matriz[i,2]*(matriz[i,1]-media)^2)
variancia = variancia / (sum(matriz[, 2]) - 1)
desvio_padrao = sqrt(variancia)
  
  
## (c) Faca uma representacao grafica para a distribuicao
barplot(matriz[, "Frequencia"],
        names.arg = matriz[, "Erros"],
        main = "Número de erros por página",
        xlab = "Erros",
        ylab = "Frequência")

## (d) Se o livro tem 500 paginas, qual o numero total de erros esperado no livro?

## Exercıcio 2. ################################################################
##  Para facilitar um projeto de ampliacao da rede de esgoto de uma certa regiao
## de uma cidade, as autoridades tomaram uma amostra de tamanho 50 dos 270 quarteiroes que
## compoem a regiao, e foram encontrados os seguintes numeros de casas por quarteirao:

