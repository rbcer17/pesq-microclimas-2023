dados_xm1 <- as.data.frame(xm_01_2023_10_29_edited_for_r)
View(dados_xm1)
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
boxplot(humidperc~hora_level,
        data=dados_xm1,
        main="Umidade por Hora",
        xlab="Hora",
        ylab="umidade relativa %",
        col="orange",
        border="brown"
)
saveRDS(dados_xm1,file="dados_xm1.Rda")
