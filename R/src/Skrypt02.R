#Load packages
library(tidyverse)
dat <- iris

#Średnia długość płatka
sredni_platek <- mean(dat$Petal.Length)

mediana_platek <- median(dat$Petal.Length)

sd_platek <- sd(dat$Petal.Length)

#srednie dla gatunków

sredni_platek_setosa <- mean(dat[1:50, 4])

sredni_platek_versl <- mean(dat[51:100, 4])

sredni_platek_virgi <- mean(dat[101:150, 4])

#srednia dla gatunku po nazwie
sredni_platek_setosa_nazwa <- mean(dat[dat$Species == "setosa", 4])

#podsumowanie
podsumowanie <- summary(dat)
podsumowanie

#podsumowanie tylko dla dwóch kolumn
podsumowanie_2 <- summary(dat[ ,1:2])
podsumowanie_2

#suma długości
dat$Suma.dlugosci <- dat$Sepal.Length + dat$Petal.Length

#Frakcja
dat$Frakcja <- (dat$Sepal.Length + dat$Petal.Length) / dat$Sepal.Width

#Srednia jako kolumna
dat$Srednia <- mean(c(dat$Sepal.Length, dat$Petal.Length))
view(dat)

#Ramka danych tylko setosa
dat_setosa <- dat[1:50, ]

#Ramka danych tylko setosa po nazwie
dat_setosa_nazwa <- dat[dat$Species == "setosa",  ]

#Ramka danych tylko po nazwie dla dwóch nazw
dat_setosa_nazwa_2 <- dat[dat$Species == c("setosa", "versicolor"),  ]

# Ramka danych tylko oryginalne kolumny
dat_oryginalne <- dplyr::select(dat, Sepal.Length:Species)

#Wybór zmiennych wg nazwy z zapisem od:do
dat_oryginalne_tylko_Sepal <- dplyr::select(dat, Sepal.Length:Sepal.Width)

#Wybór zmiennych wg nazwy z zapisem sklejanym
dat_oryginalne_tylko_2 <- dplyr::select(dat, c(Sepal.Length, Sepal.Width))

#Wybór zmiennych wg nazwy z zapisem wg początku
dat_oryginalne_tylko_3 <- dplyr::select(dat, starts_with("SPetal"))

#Wybór zmiennych wg nazwy z zapisem wg końca
dat_oryginalne_tylko_4 <- dplyr::select(dat, ends_with("Length"))

#Wybór zmiennych wg nazwy z zapisem dowolnych znaków wspólnych
dat_oryginalne_tylko_5 <- dplyr::select(dat, contains("al"))

#Wybór zmiennych wg nazwy z zapisem wg początku - zanegowane
dat_oryginalne_tylko_6 <- dplyr::select(dat, !starts_with("Petal"))

###### Wybór wierszy
# Wybór wierszy z gatunkiem setosa
dat_wiersze_1 <- dplyr::filter(dat, Species == "setosa")

# Wybór wierszy nie z gatunkiem setosa
dat_wiersze_2 <- dplyr::filter(dat, !Species == "setosa")

# Wybór wierszy gdzie Petal.Length jest większe od 5.0
dat_wiersze_3 <- dplyr::filter(dat, Petal.Length > 5.0)

# Wybór wierszy gdzie Petal. Length jest większe od 5.0 oraz mniejsze od 6.0
dat_wiersze_4 <- dplyr::filter(dat, Petal.Length > 5.0 & Petal.Length < 6.0)

