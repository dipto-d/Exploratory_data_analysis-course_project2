library(ggplot2)
library(dplyr)
baltcitymary.emissions<-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
baltcitymary.emissions.byyear<-summarise(group_by(baltcitymary.emissions,year),Emissions=sum(Emissions))
x5<-ggplot(baltcitymary.emissions.byyear, aes(x=factor(year), y=Emissions,fill=year, label = round(Emissions,2)))+ geom_col() +geom_label(aes(fill = year),colour = "white", fontface = "bold")
print(x5)
dev.copy(png,file="plot5.png",height=480,width=480)
dev.off()