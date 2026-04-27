############################################
#### Codigos da aula - Analise Bivariada ###
####      Qualitativa x Qualitativa      ###
############################################

### Exemplo 1

# vetores e tabela
curso1 = c(rep("Economia",120),rep("Administração",80))
sexo1 = c(rep("Masculino",85),rep("Feminino",35),rep("Masculino",55),rep("Feminino",25))
tabela1 = data.frame(Curso=curso1, Sexo=sexo1)
tabela1

# tabela conjunta
table(tabela1$Curso)
table(tabela1$Curso, tabela1$Sexo)

# tabela de proporcoes marginais
prop.table(table(tabela1$Curso, tabela1$Sexo), margin=2)

# graficos nao muito usaveis
barplot(table(tabela1$Curso, tabela1$Sexo))
barplot(table(tabela1$Curso, tabela1$Sexo), beside=TRUE)

# grafico usavel: proporcoes marginais empilhadas
barplot(prop.table(table(tabela1$Curso, tabela1$Sexo), margin=2))

# grafico usavel e bonito
par(mar=c(5.1, 4.1, 4.1, 7))  # codigo para mudar as margens do espaco de figura
barplot(prop.table(table(tabela1$Curso, tabela1$Sexo), margin=2),
        main="Distribuição de Curso por Gênero - Exemplo 1",
        legend.text=TRUE,
        args.legend = list(x="right", inset=c(-0.28,0)))


### Medida de associação

# tabela/matriz de valores observados
obs = table(tabela1$Curso, tabela1$Sexo)
obs


# Totais
total = sum(obs)
linhas = rowSums(obs)
colunas = colSums(obs)

# tabela/matriz de esperados
esp <- outer(linhas, colunas) / total

esp


# só pra visualizar os desvios
obs - esp

#Desvios padronizados
desv_pad = ((esp-obs)^2)/esp; desv_pad

#Qui-quadrado (soma dos desvios padronizados)
chi2=sum(desv_pad); chi2

#Coeficiente de associacao C
C=sqrt((chi2)/(chi2+sum(obs))); C


#Coeficiente de associacao T
T1=sqrt((chi2/sum(obs))/((2-1)*(3-1))); T1


#Metodo alternativo de obter o qui-quadrado: usando a estatistica do teste qui-quadrado
chisq.test(obs)

teste=chisq.test(obs)
chi2=as.numeric(teste$statistic); chi2



### Exemplo 2

# vetores e tabela
curso2 = c(rep("Física",120),rep("Sociais",80))
sexo2 = c(rep("Masculino",100),rep("Feminino",20),rep("Masculino",40),rep("Feminino",40))
tabela2 = data.frame(Curso=curso2, Sexo=sexo2)
tabela2

# tabela conjunta
table(tabela2$Curso, tabela2$Sexo)

# tabela de proporcoes marginais
prop.table(table(tabela2$Curso, tabela2$Sexo), margin=2)

# grafico simples, para interpretacao
barplot(prop.table(table(tabela2$Curso, tabela2$Sexo), margin=2))


# grafico usavel e bonito
par(mar=c(5.1, 4.1, 4.1, 7))
barplot(prop.table(table(tabela2$Curso, tabela2$Sexo), margin=2),
        main="Distribuição de Curso por Gênero - Exemplo 2",
        legend.text=TRUE,
        args.legend = list(x="right", inset=c(-0.20,0)))


### Medida de associação

# tabela/matriz de valores observados
obs = table(tabela2$Curso, tabela2$Sexo)
obs


# Totais
total = sum(obs)
linhas = rowSums(obs)
colunas = colSums(obs)

# tabela/matriz de esperados
esp <- outer(linhas, colunas) / total

esp


# só pra visualizar os desvios
obs - esp

#Desvios padronizados
desv_pad = ((esp-obs)^2)/esp; desv_pad

#Qui-quadrado (soma dos desvios padronizados)
chi2=sum(desv_pad); chi2

#Coeficiente de associacao C
C=sqrt((chi2)/(chi2+sum(obs))); C


#Coeficiente de associacao T
T1=sqrt((chi2/sum(obs))/((2-1)*(3-1))); T1


#Metodo alternativo de obter o qui-quadrado: usando a estatistica do teste qui-quadrado
chisq.test(obs)

teste=chisq.test(obs)
chi2=as.numeric(teste$statistic); chi2
