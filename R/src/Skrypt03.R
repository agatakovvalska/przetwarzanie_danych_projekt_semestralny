# 27.11.2024
library(tidyverse)
library(readxl)

# wczytywanie danych
ramka <- readxl::read_excel("C:/GitHub/przetwarzanie_danych_projekt_semestralny/R/data/dane_na_przetwarzanie_danych.xlsx")

ramka <- dplyr::rename(ramka, czas_włączenia_ekranu_godziny = "czas_włączenia_ekranu")
ramka <- dplyr::rename(ramka, czas_włączenia_ekranu_minuty = "...3")
ramka <- dplyr::rename(ramka, czas_przygotowania_śniadania_minuty = "czas_przygotowania")
ramka <- dplyr::rename(ramka, czas_przygotowania_śniadania_sekundy = "...6")
ramka <- dplyr::rename(ramka, czas_przygotowania_obiadu_sekundy = "...8")

#Zmiana nazw z wielkiej na mała
ramka_2 <- dplyr::rename_with(ramka, .cols = everything(), \(i) toupper(i))

ramka_3 <- dplyr::rename_with(ramka, .cols = dplyr::starts_with("data"), \(i) toupper(i))

ramka_4 <- dplyr::rename_with(ramka, .cols = dplyr::contains("minuty"), \(i) toupper(i))

ramka_5 <- dplyr::rename_with(ramka_2, .cols = dplyr::contains("sekundy"), \(i) tolower(i))

# Operacje na kolumnach
#wybranie kolumny
ramka[,2]
#wybranie wiersza
ramka[2,]

#dzielenie kolumn przez siebie (naprawic w excelu bo odczytuje jako tekst a nie liczby)
# operacje na kolumnach
ramka_2$kolumna9 <- ramka_2[3:23, 2] * ramka_2[3:23, 3]

#operacje na kolumnach mutate
ramka <- dplyr::mutate(ramka, wynik_dzielenia = "" / "", wynik_dodawania = "" + 1)

#operacje na kolumnach mutate (odejmowanie od kolumny i wybranie tylko tej jednej)
ramka_6 <- dplyr::mutate(ramka, "kolumna1" = "kolumna1" - 10, .keep = "none")

# przesunięcie kolumn
ramka_8 <- dplyr::relocate(ramka_5, CZAS_WŁĄCZENIA_EKRANU_MINUTY, .after = DATA)


