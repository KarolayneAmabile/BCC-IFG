## abre a tabela
mb = read.table("cars.csv", head=TRUE, sep=",", dec=".")
## extrai o nome dos objetos
names(mb)

fueltype   = mb$fueltype;
pie(table(fueltype),
    labels=c("Diesel","Gas"), 
    col = c("darkred","coral"), 
    main="Distribuição por tipo de combustível")
table(fueltype)

carcompany = mb$CarCompany;
tab_carcompany = table(carcompany)
tab_carcompany = sort(tab_carcompany, decreasing = TRUE)
par(mar = c(5, 8, 5, 8))
barplot(tab_carcompany, 
        las = 1,  horiz = TRUE,
        main =  "Distribuição de Carros por Marca", 
        xlab="Quantidade", 
        xlim = c(0,35),
        col = "steelblue")


doornumber = mb$doornumber;
tab_doornumber = table(doornumber);
barplot(tab_doornumber, 
        main = "Distribuição de carros por N° de Portas",
        xlab="N° de Portas",
        ylim = c(0, 120),
        col = 'darkslategrey')
table(doornumber)

price      = mb$price
cores = colorRampPalette(c("#c6dbef", "#08306b"))(10)
hist(price, 
     main = "Distribuição dos Preços dos Carros",
     xlab = "Preços",
     ylab = "Frequência",
     xlim = c(0, 50000),
     breaks=10,
     col = cores)