# Załadowanie paczek
library(tidyverse)

# Dane New Zealnd (z www)
dane_www <- readr::read_csv(file = "https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv")

# Wyczytanie z dysku - pełna ścieżka (bezwzględna)
dane_dysk_full_path <- readr::read_csv(file = "C:/GitHub/przetwarzanie_danych_projekt_semestralny/R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")

# Wczytanie z dysku - ścieżka względna
dane_dysk_relative_path <- readr::read_csv(file = "R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")

# Zmiana kolumny tekstowej na liczbowe
dane_dysk_relative_path$Value <- as.numeric(dane_dysk_relative_path$Value)

#Parsowanie tekstu na numer
dane <- readr::read_csv(file = "R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")
dane$Value <- readr::parse_number(dane$Value)
dane[748, "Value"]
