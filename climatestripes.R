#Warming Stripes for India
#Data: IMD

rm(list=ls())

#working directory
setwd("G:/graph-gallery")

#Loading temperature data
data<-read.csv("month_seas_ann_mean_temp_India_1901_2015_1.csv",header=T)

head(data)

#calculate anomaly
#subset for baseline
df<-subset(data,YEAR>1970 & YEAR<2001)

#calculate baseline temperature
baseline<-mean(df$ANNUAL)

#calculate anomaly
data$anomaly<-data$ANNUAL-baseline


#plot climate stripe
#library
library(ggplot2)
library(RColorBrewer)

p<-ggplot(data, aes(x=YEAR, y=1, fill=anomaly)) +
  geom_tile(show.legend = FALSE) +
  scale_fill_gradientn(colors = rev(brewer.pal(11, "RdBu"))) +
  scale_x_continuous(expand = c(0, 0))+
  scale_y_continuous(expand = c(0, 0))+
  guides(fill = guide_colorbar(barwidth = 0.5))+
  #labs(title = "Warming Stripes for India from 1901-2015", caption = "Data: IMD")+
  theme_void()

ggsave(p, file="climatestripe2.png", width=8, height=4,dpi=150,unit="in")