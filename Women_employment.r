
library(grid)
library(readr)
library(ggplot2)
library(reshape2)
library(tidyverse)
library(gridExtra)


women <- read.csv2("C:/Users/Erlend/OneDrive/Skrivebord/women/women.csv")

women$tot_full_rate<-as.numeric(women$tot_full_rate)
women$fem_emp_rate_0_2<-as.numeric(women$fem_emp_rate_0_2)
women$fem_emp_rate_6_14<-as.numeric(women$fem_emp_rate_6_14)


library(ggplot2)
women%>%
  ggplot(aes(x=tot_full_rate,y=fem_emp_rate_0_2))+
  geom_point()+
  ylim(0, 100)+
  labs(x ="Uker med 100% støtte", y = "Yrkesdeltakelse blant mødre hvis yngste barn er 0-2 år")+
  geom_smooth(method=lm, se=FALSE) -> kids_0_2

women%>%
  ggplot(aes(x=tot_full_rate,y=fem_emp_rate_6_14))+
  geom_point()+
  ylim(0, 100)+
  labs(x ="Uker med 100% støtte", y = "Yrkesdeltakelse blant mødre hvis yngste barn er 6-14 årr")+
  geom_smooth(method=lm, se=FALSE) -> kids_6_14

library(gridExtra)
library(grid)
grid.arrange(kids_0_2,kids_6_14, nrow = 1,  top = textGrob("Sammenhengen mellom foreldrepermisjons lengde og mødres yrkesdelakelse etter yngste barns alder",gp=gpar(fontsize=14,font=3)))
