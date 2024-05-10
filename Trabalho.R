message = FALSE
echo = FALSE

if (!require("quantmod", character.only = TRUE)) {
  # Instala o pacote se não estiver instalado
  install.packages("quantmod")
}
if (!require("TTR", character.only = TRUE)) {
  # Instala o pacote se não estiver instalado
  install.packages("TTR")
}
if (!require("png", character.only = TRUE)) {
  # Instala o pacote se não estiver instalado
  install.packages("png")
}
if (!require("grid", character.only = TRUE)) {
  # Instala o pacote se não estiver instalado
  install.packages("grid")
}
if (!require("jpeg", character.only = TRUE)) {
  # Instala o pacote se não estiver instalado
  install.packages("jpeg")
}

library(quantmod)
library(TTR)
library(png)
library(gridExtra)


# Lista de símbolos
simbolos <- c("PETR4.SA", "VALE3.SA", "RENT3.SA", "EGIE3.SA")

cat("\014")

getSymbols(simbolos, src = "yahoo")

graficoA <- list()
graficoB <- list()
graficoC <- list()

i <- 1
acao <- simbolos[i]
png(paste("graficoA",i,".png"), width = 800, height = 600)
chartSeries(get(acao), name = paste("Candle Stick ",acao), theme = "white", subset = "last 1 year")
addBBands()
addSMA(n = c(50, 200))
addMACD()
dev.off()


i <- 2
acao <- simbolos[i]
png(paste("graficoA",i,".png"), width = 800, height = 600)
chartSeries(get(acao), name = paste("Candle Stick ",acao), theme = "white", subset = "last 1 year")
addBBands()
addSMA(n = c(50, 200))
addMACD()
dev.off()

i <- 3
acao <- simbolos[i]
png(paste("graficoA",i,".png"), width = 800, height = 600)
chartSeries(get(acao), name = paste("Candle Stick ",acao), theme = "white", subset = "last 1 year")
addBBands()
addSMA(n = c(50, 200))
addMACD()
dev.off()

i <- 4
acao <- simbolos[i]
png(paste("graficoA",i,".png"), width = 800, height = 600)
chartSeries(get(acao), name = paste("Candle Stick ",acao), theme = "white", subset = "last 1 year")
addBBands()
addSMA(n = c(50, 200))
addMACD()
dev.off()

  
for (i in 1:4) {
  # Define a data atual
  data_atual <- Sys.Date()
  
  # Define a data de início do ano atual
  inicio_ano <- as.Date(paste0(format(data_atual, "%Y"), "-01-01"))
  
  acao <- simbolos[i]

  getSymbols(acao, src = "yahoo", from = inicio_ano, to = data_atual)
  
  valores <- na.omit(Ad(get(acao)))
  
  png(paste("graficoB",i,".png"), width = 800, height = 600)
  hist(valores, main = paste("Histograma dos Preços Ajustados ",acao), xlab = "Preço Ajustado", ylab = "Frequencia", col = "lightblue")
  dev.off()
  
  Sys.sleep(1)
  
  png(paste("graficoC",i,".png"), width = 800, height = 600)
  plot(valores, main = paste("Série Temporal dos Preços Ajustados da ",acao), ylab = "Preço Ajustado", col = "blue")
  dev.off()
  
# Carrega as imagens PNG
  graficoA[[i]]<-readPNG(paste("graficoA",i,".png"))
  graficoB[[i]]<-readPNG(paste("graficoB",i,".png"))
  graficoC[[i]]<-readPNG(paste("graficoC",i,".png"))
  
}

i <- 1
acao <- simbolos[i]
getSymbols(acao, src = "yahoo", from = inicio_ano, to = data_atual)
valores <- na.omit(Ad(get(acao)))
png(paste("graficoC",i,".png"), width = 800, height = 600)
plot(valores, main = paste("Série Temporal dos Preços Ajustados da ",acao), ylab = "Preço Ajustado", col = "blue")
dev.off()
  
i <- 2
acao <- simbolos[i]
getSymbols(acao, src = "yahoo", from = inicio_ano, to = data_atual)
valores <- na.omit(Ad(get(acao)))
png(paste("graficoC",i,".png"), width = 800, height = 600)
plot(valores, main = paste("Série Temporal dos Preços Ajustados da ",acao), ylab = "Preço Ajustado", col = "blue")
dev.off()

i <- 3
acao <- simbolos[i]
getSymbols(acao, src = "yahoo", from = inicio_ano, to = data_atual)
valores <- na.omit(Ad(get(acao)))
png(paste("graficoC",i,".png"), width = 800, height = 600)
plot(valores, main = paste("Série Temporal dos Preços Ajustados da ",acao), ylab = "Preço Ajustado", col = "blue")
dev.off()

i <- 4
acao <- simbolos[i]
getSymbols(acao, src = "yahoo", from = inicio_ano, to = data_atual)
valores <- na.omit(Ad(get(acao)))
png(paste("graficoC",i,".png"), width = 800, height = 600)
plot(valores, main = paste("Série Temporal dos Preços Ajustados da ",acao), ylab = "Preço Ajustado", col = "blue")
dev.off()

for (i in 1:4) {
#Carrega as imagens PNG
  graficoC[[i]]<-readPNG(paste("graficoC",i,".png"))
}


# Exibe as imagens lado a lado
grid.arrange(grid::rasterGrob(graficoA[[1]]), grid::rasterGrob(graficoB[[1]]), grid::rasterGrob(graficoC[[1]]),
             grid::rasterGrob(graficoA[[2]]), grid::rasterGrob(graficoB[[2]]), grid::rasterGrob(graficoC[[2]]),
             grid::rasterGrob(graficoA[[3]]), grid::rasterGrob(graficoB[[3]]), grid::rasterGrob(graficoC[[3]]),
             grid::rasterGrob(graficoA[[4]]), grid::rasterGrob(graficoB[[4]]), grid::rasterGrob(graficoC[[4]]), ncol = 6)

png("grafico_final.png", width = 4800, height = 1200)
grid.arrange(grid::rasterGrob(graficoA[[1]]), grid::rasterGrob(graficoB[[1]]), grid::rasterGrob(graficoC[[1]]),
             grid::rasterGrob(graficoA[[2]]), grid::rasterGrob(graficoB[[2]]), grid::rasterGrob(graficoC[[2]]),
             grid::rasterGrob(graficoA[[3]]), grid::rasterGrob(graficoB[[3]]), grid::rasterGrob(graficoC[[3]]),
             grid::rasterGrob(graficoA[[4]]), grid::rasterGrob(graficoB[[4]]), grid::rasterGrob(graficoC[[4]]), ncol = 6)
dev.off()
