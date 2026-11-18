
# Daten einlesen
daten_ess <- read.csv(file = "daten/TD_ESS.csv")

# nicht benötigte Variablen l??schen


# Fehlender Werte der metrischen Variablen definieren
daten_ess$agea[daten_ess$agea==999] <- NA
daten_ess$yrbrn[daten_ess$yrbrn>7000] <- NA
daten_ess$eduyrs[daten_ess$eduyrs>77] <- NA

# Fehler in den Faellen korrigieren



# Faktoren definieren