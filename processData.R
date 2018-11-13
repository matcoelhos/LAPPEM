setwd("/home/mateus/Documentos/Pulse-Oximeter")
system("ls Medicoes_23_10_2018/ > filelist.txt")
#system("ls 26-10/ > filelist.txt")

file_list <- read.table("filelist.txt")

ts <- (0:(length(file_list$V1)-1))*10
IR <- vector(mode = "numeric", length = length(file_list$V1))
R <- vector(mode = "numeric", length = length(file_list$V1))
G <- vector(mode = "numeric", length = length(file_list$V1))
B <- vector(mode = "numeric", length = length(file_list$V1))

for (i in (1:length(file_list$V1)))
{
  data = read.table(paste("Medicoes_23_10_2018/", as.character(file_list$V1[i]), sep = ""), header = F)
  #data = read.table(paste("26-10/", as.character(file_list$V1[i]), sep = ""), header = F)
  data = 850 - data
  plot(data$V1, type = 'l', col = 'orange', ylim = c(0, 1000), ylab = 'Absorved Light')
  par(new = T)
  plot(data$V2, type = 'l', col = 'black', ylim = c(0, 1000), ylab = '')
  par(new = T)
  plot(data$V3, type = 'l', col = 'red', ylim = c(0, 1000), ylab = '')
  par(new = T)
  plot(data$V4, type = 'l', col = 'green', ylim = c(0, 1000), ylab = '')
  par(new = T)
  plot(data$V5, type = 'l', col = 'blue', ylim = c(0, 1000), ylab = '')
  
  IR[i] <- mean(data$V2)
  R[i] <- mean(data$V3)
  G[i] <- mean(data$V4)
  B[i] <- mean(data$V5)
  
}

plot(ts, IR, type = 'l', col = 'orange', ylab = '')
plot(ts, R, type = 'l', col = 'red', ylim = c(0, 200), ylab = '')
par(new = T)
plot(ts, G, type = 'l', col = 'green', ylim = c(0, 200), ylab = '')
par(new = T)
plot(ts, B, type = 'l', col = 'blue', ylim = c(0, 200), ylab = '')
