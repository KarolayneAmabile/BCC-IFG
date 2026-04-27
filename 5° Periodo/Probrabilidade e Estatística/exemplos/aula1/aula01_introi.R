####################################################
###### CODIGOS DA AULA - 27/03/2026 ################
####################################################

### lendo a tabela ###

mb = read.table("tabela_mb.csv", head=TRUE, sep=";", dec=".")

names(mb)


### extraindo vetores ###

civil = mb$civil

instru = mb$instrucao


attach(mb)

salario



### Tabulando dados ###

table(civil)

table(instrucao)

table(regiao)


tab_civil = table(civil)
tab_civil

prop.table(table(civil))

prop.table(tab_civil)

round(prop.table(tab_civil), 2)



### Graficos de Barras e Colunas

barplot(civil)

barplot(tab_civil)

barplot(table(instrucao))

barplot(tab_civil, horiz=TRUE)



barplot(tab_civil, main="Estado Civil")


barplot(tab_civil, main = "Estado Civil", 
        xlab="Estado Civil", ylab="Frequência")


barplot(tab_civil, main = "Estado Civil", 
        xlab="Estado Civil", ylab="Frequência",
        col=c("blue","red"), 
        legend.text = c("casado","solteiro"))


barplot(prop.table(tab_civil), main = "Estado Civil", xlab="Estado Civil", 
        ylab="Proporção", col=c("green","gold"),ylim = c(0,1))

### Grafico de Setores


pie(civil)

pie(tab_civil)

pie(table(civil),
    labels=c("Casados","Solteiros"), 
    col = c("red","blue"))

pie(table(civil),
    labels=c("Casados","Solteiros"), 
    col = c("red","blue"), 
    main="Estado Civil",
    init.angle = 45)



### Grafico de pontos

plot(salario)

plot(salario, main="Salários dos funcionários")

plot(idade)


plot(salario, idade)

plot(idade, n_filhos)



### Histogramas

hist(salario)

hist(salario, main = "Salários dos funcionários")

hist(salario, main = "Salários dos funcionários", xlab="Salários", ylab="Frequência", 
     col="gold")


hist(salario, main = "Salários dos funcionários", xlab="Salários", ylab="Frequência",
     breaks=c(4, 7.5, 11, 14.5, 18, 21.5, 25))

hist(salario, main = "Salários dos funcionários", xlab="Salários", ylab="Frequência",
     nclass=6)

hist(salario, main = "Salários dos funcionários", xlab="Salários", ylab="Proporção",
     probability = TRUE)


## Obs.: se quiser, pode salvar o histograma como objeto. Veja:

histograma = hist(salario, main = "Salários dos funcionários", xlab="Salários", ylab="Frequência",
                  breaks=c(4, 7.5, 11, 14.5, 18, 21.5, 25))

histograma


