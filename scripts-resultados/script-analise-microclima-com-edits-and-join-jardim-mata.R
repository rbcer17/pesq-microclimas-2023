dados_xm1 <- as.data.frame(xm01_10nov2023_clean_dates)
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
#agora vamos importar outra matriz e juntar:
#primeiro vamos copiar os dados do xm1 para xm_master
xm_master <- dados_xm1
#agora vamos importar outros dados
dados_xmtemp <- as.data.frame(xm_06_for_r_08nov2023)
library(stringr)
View(dados_xmtemp)
names(dados_xmtemp)
names(dados_xmtemp)[names(dados_xmtemp) == "Temperature"] <- "tempc"
names(dados_xmtemp)[names(dados_xmtemp) == "Humidity"] <- "umidrel"
dados_xmtemp$habitat <- "mata"
# extract characters from 4th index to 7th index
dados_xmtemp$hora <- str_sub(dados_xmtemp$Date, 12, 13)  # prints hour
dados_xmtemp$hora_level <- as.factor(dados_xmtemp$hora)
#agora juntar o novo dataframe dentro do xm_master
xm_master <- rbind(xm_master,dados_xmtemp)
xm_master$habitat_level <- as.factor(xm_master$habitat)
#agora vamos fazer um boxplot combinado usando o xm master
# Agora vamos fazer um boxplot da temperatura por hora:
boxplot(tempc~habitat_level*hora_level,
        data=xm_master,
      #  boxwex=0.4,
        main="Temperatura por Hora",
        col=c("slateblue1" , "tomato") ,
        xlab="Hora",
        ylab="temp celsius",
        xaxt="n",
        border="brown"
)
legend("bottomright", legend = c("Jardim", "Mata"), 
       col=c("slateblue1" , "tomato"),
       pch = 15, bty = "n", pt.cex = 3, cex = 1.2,  horiz = F, inset = c(0.1, 0.1))
#agora umidade relativa:
boxplot(umidrel~habitat_level*hora_level,
        data=xm_master,
        #  boxwex=0.4,
        main="Umidade por Hora",
        col=c("slateblue1" , "tomato") ,
        xlab="Hora",
        ylab="umidade por cento",
        xaxt="n",
        border="brown"
)
legend("bottomright", legend = c("Jardim", "Mata"), 
       col=c("slateblue1" , "tomato"),
       pch = 15, bty = "n", pt.cex = 3, cex = 1.2,  horiz = F, inset = c(0.1, 0.1))
#agora so a mata para checar se a legenda ta certa
boxplot(tempc~hora_level,
        data=dados_xmtemp,
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