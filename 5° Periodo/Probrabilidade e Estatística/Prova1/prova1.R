mb = read.table("problema1.csv", head=TRUE, sep=";", dec=".")
names(mb)

## tipos de variaveis
# genero                  qualitativa nominal
# modalidade_estudo       qualitativa nominal
# area_interesse          qualitativa nominal
# nota_final              quantitativa continua
# horas_semana            quantitativa continua
# atividades_realizadas   quantitativa discreva

## Considerando os custos envolvidos na contratação de tutores, está sendo avaliado o alcance
## dessa modalidade de estudos, isto é, o quanto os estudantes buscaram o auxílio desse
## profissional. Qual sua contribuição para essa discussão?


# R: Dos 100 alunos participantes, apenas 24% buscaram o tutor como modalidade de estudo.
# Esse percentual é baixo em relação aos alunos autodidatas (46%) ou que pertecem ao grupo de estudos (30%).
# Mas é interessante analisar, para além disso, a relação entre o auxilio do tutor e o desempenho do
# estudante na nota final. Isso poderá ser observado adiante, na questão 04.

modalidade = mb$Modalidade_Estudo

freq = table(modalidade)
perc = prop.table(freq) * 100

labels = paste(names(freq), paste0(round(perc, 1), "%"))
pie(freq,
    labels = labels,
    col = c("darkred", "coral", "chocolate"),
    main = "Distribuição dos estudantes por tipo de modalidade de estudo adotada")
freq

##  Para entender o engajamento médio dos estudantes, a equipe de ensino quer avaliar quanto
# tempo os alunos costumam dedicar semanalmente ao curso. Essa informação pode orientar
# a carga horária prevista e os prazos das atividades. O que os dados indicam sobre esse
# comportamento?

# R: Observando o histograma gerado, podemos observar que a maioria dos estudantes estuda cerca de 6 a 10
# semanas por dia. A média de horas estudadas é de 8.198, a mediana 8.2 e a moda 9.6; confirmando essa
# tendência, sabemos também que o segundo (50%) quantil é de 8.2 e o terceiro (75%) de 9.9. Isto posto,
# é possível afirmar que pelo menos 75% dos estudantes dedicam pelo menos 8h de estudo semanal,
# sendo que 50% dos estudantes estuda entre 8h2 a 12h semanais. 

# R: media: 8.198, mediana: 8.2, moda: 9.6. 
horas = mb$Horas_Semana
cores = colorRampPalette(c("#c6dbef", "#08306b"))(10)
hist(horas, 
     main = "Distribuição dos estudantes por quantidade de horas dedicadas às atividades",
     xlab = "Horas dedicadas às atividades",
     ylab = "Frequência",
     col = cores)

mean(horas)   ## 8.198
median(horas) ## 8.2

moda <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
moda(horas)   ## 9.6
quantile(horas)

## A equipe deseja personalizar os cursos de acordo com o perfil dos estudantes. Para isso,
# quer saber se existe alguma relação entre a modalidade de estudo escolhida e a área de
# interesse do aluno. Há algum padrão relevante que justifique estratégias diferenciadas?

modalidade = mb$Modalidade_Estudo
area = mb$Area_Interesse




