setwd('../Desktop/Mini-Project')
library(ggplot2)
library(tidyverse)

dat <- read.table('test.txt')
colnames(dat) <- c('time', 'AA', 'AAfull', 'AAhungry', 'AB', 'ABfull', 'ABhungry', 'BB', 'BBfull', 'BBhungry', 'AAAA', 'AAAB', 'ABAB', 'ABBB', 'BBBB', 'food')

A <- rowSums(2*dat[,2:4]) + rowSums(dat[,5:7])
B <- rowSums(2*dat[,8:10]) + rowSums(dat[,5:7])
AlleleFreq <- data.frame(A,B,dat$time)
AlleleFreq <- gather(AlleleFreq, 'Allele', 'Count', 1:2)
colnames(AlleleFreq)[1] <- 'Time'
ggplot(AlleleFreq, mapping = aes (x = Time, y = Count)) + geom_smooth(aes(colour = factor(Allele)))
