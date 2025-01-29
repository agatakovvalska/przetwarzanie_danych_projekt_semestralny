#ggplot intro 29.012025

#paczki
library(tidyverse)

#Dane
zab_hydrochemia <- read.csv("C:/GitHub/przetwarzanie_danych_projekt_semestralny/R/data/dane_29_01/zab_hydrochemistry-lake.csv") |> 
  mutate(date = lubridate::ymd(date))

#wykres: x = czas, y = wartość (ca)
ggplot2::ggplot(zab_hydrochemia, aes(date, ca)) + 
  geom_line()

#wykres: x = czas, y = wartość (ca) - serie pokolorowane - głębokość
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = depth)) + 
  geom_line()

#wykres: x = czas, y = wartość (ca) - serie pokolorowane - głębokość jako wartości dyskretne
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = factor(depth))) + 
  geom_line()

#wykres: x = czas, y = wartość (ca) - serie pokolorowane - głębokość jako wartości dyskretne, panele
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = factor(depth))) + 
  geom_line() + 
  facet_wrap(vars(depth))

#wykres: x = czas, y = wartość (ca) - serie pokolorowane - głębokość jako wartości dyskretne, panele, dalsze rozwinięcie
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = factor(depth))) + 
  geom_line() + 
  facet_wrap(vars(depth), ncol = 1)

#wykres: x = czas, y = wartość (ca) - serie pokolorowane - głębokość jako wartości dyskretne, panele, dalsze rozwinięcie, brak tła, linie osi itd
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = factor(depth))) + 
  geom_line() + 
  facet_wrap(vars(depth), ncol = 1) + 
  theme(panel.background = element_blank())

# Wczytaj dane zab_temperatura_daily
zab_temp <- read.csv("C:/GitHub/przetwarzanie_danych_projekt_semestralny/R/data/dane_29_01/zab_temperature-daily.csv") |> 
  mutate(day = lubridate::ymd(day))

# Wykres temperatury wody w czasie, temperatura na pierwszym metrze, punkty, linia, wygładzone
ggplot(zab_temp, aes(day, temp_01)) + 
  geom_point() + 
  geom_line(color = "pink") + 
  geom_smooth()

# Wykres z seriami rozbitymi na panele, wszystkie głębokości
zab_temp |> 
  tidyr::pivot_longer(cols = starts_with("temp_"), names_to = "glebokosc", values_to = "temperatura") |> 
  ggplot(aes(day, temperatura)) + 
  geom_line() + 
  facet_wrap(vars(glebokosc), ncol = 1, scales = "free")

# Wczytaj dane dotyczące pułapki sedymentacyjnej
zab_trap <- read.csv("C:/GitHub/przetwarzanie_danych_projekt_semestralny/R/data/dane_29_01/zab_sediment-trap_hypolimnion.csv") |> 
  mutate(date = lubridate::ymd(date))

# Wykres kolumnowy z tempa akumulacji masy
zab_trap |> 
  ggplot(aes(date, mar)) + 
  geom_col()

zab_trap |> 
  ggplot() + 
  geom_rect(aes(xmin = lead(date), xmax = date, ymin = 0, ymax = mar))

# Boxplot
ggplot(zab_hydrochemia) + geom_boxplot(aes(y = ca, group = factor(depth)))

# Violinplot
ggplot(zab_hydrochemia) + geom_violin(aes(x = factor(depth), y = ca,))

#histogram?
ggplot(zab_hydrochemia) + geom_histogram(aes(ca, fill = factor(depth)))
