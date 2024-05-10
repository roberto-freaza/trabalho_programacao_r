# Exemplo de tweets estáticos
static_tweets <- data.frame(
  screen_name = c("user1", "user2", "user3", "user1", "user2"),
  text = c("Este é um tweet de exemplo 1.", 
           "Este é um tweet de exemplo 2.",
           "Este é um tweet de exemplo 3.",
           "Este é um tweet de exemplo 4.",
           "Este é um tweet de exemplo 5.")
)

# Carregue a biblioteca ggplot2
library(ggplot2)

#tweets por usuário
ggplot(data = static_tweets, aes(x = screen_name)) +
  geom_bar(fill = "skyblue", color = "black") +
  theme_minimal() +
  labs(title = "Contagem de Tweets por Usuário (Exemplo Estático)", x = "Usuário", y = "Contagem de Tweets")