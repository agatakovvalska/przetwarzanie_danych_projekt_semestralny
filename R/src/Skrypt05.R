#paczki
library(tidyverse)
test <- c(6, 7, 8, 9)
test <- cumsum(test)
test <- mean(test)
test <- mean(cumsum(c(6, 7, 8,9)))

test <- c(6, 7, 8, 9)

#test_potokowania
#1.stworzyć wektor 2.policzyc sumę skumulowaną 3.policzyc średnią
#nadpisywanie kolejnymi wartościami
dane_nadpisywane <- c(6,7,8,9)

dane_nadpisywane <- cumsum(dane_nadpisywane)

dane_nadpisywane <- mean(dane_nadpisywane)

#zapis z zagnieżdżoną funkcją
dane_funkcja <- mean(cumsum(c(6,7,8,9)))

#zapis z użyciem potokowania ("pipe")
dane_potok <- c(6,7,8,9) |> 
  #komentarz
  cumsum() |>
  #komentarz2
  mean()

# tidyr ####
data <- iris

# Zmiana formatu long na wide
l_2_w <- data |> 
  tidyr::pivot_wider(names_from = Species, values_from = Sepal.Length:Petal.Width)

library(palmerpenguins)
pingwiny <- palmerpenguins::penguins

#zmiana formatu long na wide
#pingwiny_wide <- pingwiny |> 
#  tidyr::drop_na() |> 
  # zmiana formatu na "szerszy"
#  tidyr::pivot_wider(names_from = sex, values_from = )

#dodawanie numerów, nowa kolumna, każdy pingwin ponumerowany
pingwiny <- pingwiny |> 
  dplyr::mutate(id = 1:length(year))
#Zmiana formatu wide na long
pingwiny_longer <- pingwiny |> 
  tidyr::pivot_longer(bill_length_mm:body_mass_g, names_to = "zmienna", values_to = "wartości", )

# Wykres
ggplot2::ggplot(pingwiny_longer, aes(year, wartości, colour = species)) + 
  geom_point() + 
  facet_wrap(vars(zmienna))

#Do szerokiego
pingwiny_wider <- pingwiny_longer |> 
  #zmiana formatu ramki
  tidyr::pivot_wider(names_from = zmienna, values_from = wartości)

#Joins (operacje na wielu ramkach) ####
#Podział na płeć
pingwiny_m <- pingwiny |> 
  #wybór samców
  dplyr::filter(sex == "male")

#wybór samic (poprzez wybranie wszystkiego co nie jest samcem, negowanie)
pingwiny_f <- pingwiny |> 
  dplyr::filter(!sex == "male")

#łączenie wierszy - bind rows
pingwiny_m_f <- dplyr::bind_rows(pingwiny_m, pingwiny_f)

#Podział kolumnami
pingwiny_1 <- pingwiny |> 
  dplyr::select(species:body_mass_g)

pingwiny_2 <- pingwiny |> 
  dplyr::select(-c(species:body_mass_g))

#Łączenie kolumn - bind cols
pingwiny_1_2 <- dplyr::bind_cols(pingwiny_1, pingwiny_2)

