
# Daten einlesen
daten_ess <- read.csv(file = "Daten/TD_ESS.csv")

# nicht benötigte Variablen loeschen
daten_ess$name <- NULL
daten_ess$essround <- NULL
daten_ess$edition <- NULL
daten_ess$proddate <- NULL
daten_ess$cntry <- NULL
daten_ess$dweight <- NULL


# Fehlender Werte der metrischen Variablen definieren
daten_ess$agea[daten_ess$agea==999] <- NA
daten_ess$yrbrn[daten_ess$yrbrn>7000] <- NA
daten_ess$eduyrs[daten_ess$eduyrs>77] <- NA
daten_ess$pplhlp[daten_ess$pplhlp>10] <- NA
daten_ess$ppltrst[daten_ess$ppltrst>10] <- NA
daten_ess$wkhtot[daten_ess$wkhtot>665] <- NA

# Fehler in den Faellen korrigieren
which(daten_ess$agea==320)
which(daten_ess$yrbrn>2003) 
which(daten_ess$eduyrs==0 &
        daten_ess$eisced==7)
which(daten_ess$eduyrs>13 &
        daten_ess$eisced==1)
## ...die Fehler scheinen nicht mehr vorhanden zu sein...
## Falls vorhanden:
#daten_ess$agea['Neue Fallnummer von 74'] <- 32
#daten_ess$yrbrn['Neue Fallnummer von 599'] <- 2018 - daten_ess$agea['Neue Fallnummer']
#daten_ess$eisced['Neue Fallnummer von 5'] <- round(mean(daten_ess$eisced[daten_ess$eduyrs==18], 
                                                        #na.rm = TRUE))
#daten_ess <- daten_ess[-c('Neue Fallnummer von 1404'),]

# Faktoren definieren
## ordinale Variablen
daten_ess$netusoft <- factor(daten_ess$netusoft, 
                              ordered = T,
                              levels = 1:5,
                              labels = c("Never",
                                         "Only occasionally",
                                         "A few times a week",
                                         "Most days",
                                         "Every day"))
daten_ess$eisced <- factor(daten_ess$eisced, 
                           ordered = T,
                           levels = 1:7,
                           labels = c("ES-ISCED I",
                               "ES-ISCED II",
                               "ES-ISCED IIb",
                               "ES-ISCED IIIa",
                               "ES-ISCED IV",
                               "ES-ISCED V1",
                               "ES-ISCED V2"))
## nominale Variablen
daten_ess$gndr <- factor(daten_ess$gndr,
                         levels = c(1,2),
                         labels = c("Männlich", 
                                    "Weiblich"))
daten_ess$pdwrk <- factor(daten_ess$pdwrk,
                         levels = c(0,1),
                         labels = c("No", "Yes"))
daten_ess$edctn <- factor(daten_ess$edctn,
                           levels = c(0,1),
                           labels = c("No", "Yes"))
daten_ess$uemp3m <- factor(daten_ess$uemp3m,
                             levels = c(1,2),
                             labels = c("Yes", "No"))