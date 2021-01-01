#plot(Corona$datum,Corona$infizierte_gesamt)
#plot(datum, infizierte_aktuell)
#summary(Corona)


# Corona File einlesen
Corona <- read.csv("corona_stade.csv",header=T,na.strings="?")
attach(Corona)

# neue Spalte mit 0
Corona$neue_inf_zum_vortag <- 0
Corona$wachstum_gesamt <- 0
Corona$wachstum_aktuell_inf <- 0
n <- nrow(Corona)
if (n > 1) for(i in 2:n) Corona$neue_inf_zum_vortag [i] <- ( Corona$infizierte_gesamt[i] - Corona$infizierte_gesamt[i-1] )
if (n > 1) for(i in 2:n) Corona$wachstum_gesamt[i] <- ( Corona$infizierte_gesamt[i] - Corona$infizierte_gesamt[i-1] ) / Corona$infizierte_gesamt[i-1] * 100
if (n > 1) for(i in 2:n) Corona$wachstum_aktuell_inf[i] <- ( Corona$infizierte_gesamt[i] - Corona$infizierte_gesamt[i-1] ) / infizierte_aktuell[i-1] * 100
Corona$neue_inf_zum_vortag[1] <- NA
Corona$wachstum_aktuell_inf[1] <- NA
Corona$wachstum_gesamt[1] <- NA


par(mfrow=c(2,2))

plot(Corona[,1],Corona[,2], type = "p" , col = "red", main="Covid-19, STD", ylab = "Anz. (rot:gesamt,grün:aktuell,blau:genesen", xlab = "Tag")
lines(Corona[,1],Corona[,3],col="green")
lines(Corona[,1],Corona[,2],col="red")
lines(Corona[,1],Corona[,4],col="blue")


plot(Corona$datum,Corona$neue_inf_zum_vortag,col="blue",main="Covid-19, STD: neue Infizierte ggü. Vortag", ylab = "Anzahl neue Infizierte ggü. Vortag", xlab = "Tag")
lines(Corona$datum,Corona$neue_inf_zum_vortag,col="red")

plot(Corona$datum,Corona$wachstum_gesamt,col="blue",main="Covid-19, STD: Wachstum gesamt", ylab = "Anzahl neue Infizierte ggü. Vortag", xlab = "Tag")
lines(Corona$datum,Corona$wachstum_gesamt,col="red")

plot(Corona$datum,Corona$wachstum_aktuell_inf,col="blue",main="Covid-19, STD: Wachstum gesamt", ylab = "Anzahl neue Infizierte ggü. Vortag", xlab = "Tag")
lines(Corona$datum,Corona$wachstum_aktuell_inf,col="red")





