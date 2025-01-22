# 15.01.2025

#paczki

library(tidyverse)

#Wczytanie danych
data_1 <- readxl::read_excel("C:/GitHub/przetwarzanie_danych_projekt_semestralny/R/data/data_msu.xlsx", sheet = "loi")

data_2 <- readxl::read_excel("C:/GitHub/przetwarzanie_danych_projekt_semestralny/R/data/data_msu.xlsx", sheet = "elemental")

data_3 <- readxl::read_excel("C:/GitHub/przetwarzanie_danych_projekt_semestralny/R/data/data_msu.xlsx", sheet = "bsi")

#Pokazuje jakie mamy arkusze w excelu, taki dodatek
readxl::excel_sheets("C:/GitHub/przetwarzanie_danych_projekt_semestralny/R/data/data_msu.xlsx")

#Łączenie ramek (mutating join)
#Left join
data_left_1 <- dplyr::left_join(x = data_1, y = data_2)

data_left_2 <- dplyr::left_join(x = data_1, y = data_3)

data_left_3 <- dplyr::left_join(x = data_1, y = data_3, by = dplyr::join_by(sample.id == sample.id))

data_left_4 <- dplyr::left_join(dplyr::select(data_1, -mass.mg), dplyr::rename(data_3, nazwa.id = sample.id), dplyr::join_by (sample.id == nazwa.id))

# x=_ to wynik tego co jest po lewej stronie, to co jest potokowane?
data_left_5 <- dplyr::left_join(data_1, data_2, by = dplyr::join_by(sample.id)) |> 
  dplyr::left_join(x = _, y = data_3, by = dplyr::join_by(sample.id))

#Right join
data_right_1 <- dplyr::right_join(data_1,data_2)

data_right_2 <- dplyr::right_join(data_3, data_1, by = dplyr::join_by(sample.id)) |> 
  dplyr::right_join(data_2, by = dplyr::join_by(sample.id))

#Łączenie wszystkiego - inner
data_inner_1 <- dplyr::inner_join(x = data_1, y = data_2)

#Szalone nutki
data_szalone <- dplyr::inner_join(data_1, data_3, by = dplyr::join_by(sample.id)) |> 
  dplyr::right_join(data_right_1)

#Łączenie wszystkiego - full join
data_full_1 <- dplyr::full_join(data_1, data_2)

#Semi join
data_semi_1 <- dplyr::semi_join(data_1, data_2)

#Anti join
data_anti_1 <- dplyr::anti_join(data_3, data_1)
