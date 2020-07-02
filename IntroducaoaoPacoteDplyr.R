# Script - Introdução ao Pacote Dplyr

# Pacote:

install.packages("dplyr")
library(dplyr)

# Banco de Dados

starwars # O banco de dados já vem com o pacote

################################ Código ##################################

# Verificando a classe do banco de dados:

class(starwars)

# Operador PIPE

head(starwars, 10) # Sem o operador PIPE

starwars %>%  # Com o operador PIPE
  head(10)

# Funçaõ select()

starwars %>%  # Exemplo 1
  select(name, species, homeworld)

starwars %>% # Exemplo 2
  select(name, species, gender, everything())

starwars %>% # Exercício 1
  select(name, hair_color, eye_color)

# Função: filter()

starwars %>% # Exemplo 1 
  filter(mass > 50)

starwars %>% # Exemplo 2
  filter(mass < 50)

starwars %>% # Exemplo 3
  filter(mass >= 50 & mass <= 100)

starwars %>% # Exercício 2
  filter(mass >= 203)

# Função: mutate()

data <- starwars %>% # Exemplo 1
  mutate(heightM = height / 100)

data

data$heightM %>%# Visualização da nova coluna criada com mutate()
  head(87)

data %>% # Exercício 3
  mutate(imc = mass/(heightM**2)) %>% 
  select(name, imc)

# Função: arrange()

starwars %>% # Exemplo 1 - Oredem crescente
  arrange(height)

starwars %>% # Exemplo 2 - Ore=dem decrescente
  arrange(desc(height))

starwars %>% # Exercício 4
  arrange(desc(mass))

# Função: summarise()

starwars %>% # Exemplo 1
  summarise(height.mean = mean(height, na.rm = T))

starwars %>% # Exercício 5
  summarise(mass.mean = mean(mass, na.rm = T))

# Função: group_by()

starwars %>% # Exemplo 1
  group_by(species) %>%
  summarise(
    n = n(), # fornece o tamanho atual do grupo
    massmean = mean(mass, na.rm = TRUE)
  ) %>%
  filter(
    n > 1,
    massmean > 50
  )

starwars %>% # Exercício 6
  group_by(species) %>%
  summarise(
    n = n(),
    heightmean = mean(height, na.rm = TRUE)
  ) %>%
  filter(
    n > 1,
    heightmean < 80
  )