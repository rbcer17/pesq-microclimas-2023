dados_xm1 <- as.data.frame(xm_01_2023_10_29)
library(stringr)
View(dados_xm1)
names(dados_xm1)
names(dados_xm1)[names(dados_xm1) == "Temperature"] <- "tempc"
names(dados_xm1)[names(dados_xm1) == "Humidity"] <- "umidrel"
dados_xm1$habitat <- "jardim"
# extract characters from 4th index to 7th index
dados_xm1$hora <- str_sub(dados_xm1$Date, 12, 13)  # prints hour
dados_xm1$hora_level <- as.factor(dados_xm1$hora)
# Agora vamos fazer um boxplot da temperatura por hora:
boxplot(tempc~hora_level,
        data=dados_xm1,
        main="Temperatura por Hora",
        xlab="Hora",
        ylab="temp celsius",
        col="orange",
        border="brown"
)
# E um boxplot da umidade por hora:
boxplot(umidrel~hora_level,
        data=dados_xm1,
        main="Umidade por Hora",
        xlab="Hora",
        ylab="umidade relativa %",
        col="orange",
        border="brown"
)
saveRDS(dados_xm1,file="dados_xm1.Rda")
