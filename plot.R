# load packages
library(ggplot2)
library(patchwork)
library(dplyr)

# obtain file name input 
args <- commandArgs()
file_name <- args[6]
print(paste('now working on file: ',file_name, sep = ""))
out_name<-paste(sapply(strsplit(file_name,".csv"), `[`, 1),'_out.jpeg', sep = "")

# read input csv
tbl<-read.csv(file_name,fileEncoding = "UTF-8")
tbl <- tbl[,-1]
# handle missing value
tb1<-na.omit(tbl)

# draw plots based on number of columns
if (ncol(tbl)==3){
  jpeg(file=paste('./output/',out_name, sep = ""))
  p1=ggplot(tbl,aes(x=x))+geom_bar(stat="bin",fill="lightsteelblue1",binwidth=0.2)+theme_classic()+ggtitle('Bar Plot x')
  p2=ggplot(tbl,aes(x=y))+geom_bar(fill="rosybrown2")+theme_classic()+ggtitle('Bar Plot y')
  
  # pie plot
  a <- as.data.frame(summary(as.factor(tbl$z)))
  colnames(a) = c('value')
  a <- a %>%
    mutate(category = rownames(a)) %>%
    mutate(percentage = paste((round(value/sum(value),digits=3)*100),'%'))
  
  
  p3=ggplot(a, aes(x = "", y = value, fill = category)) +
    geom_col(color = "white") +
    geom_label(aes(label = percentage), 
               position = position_stack(vjust = 0.5),
               show.legend = FALSE) +
    guides(fill = guide_legend(title = "Category")) +
    scale_fill_viridis_d() +
    coord_polar(theta = "y") + 
    theme_void()+ggtitle('Pie Chart z')
  
  # combine plots
  print((p2|p3)/p1)

  
}else if (ncol(tbl)==4){
  jpeg(file=paste('./output/',out_name, sep = ""))
  p1=ggplot(tbl,aes(x=x))+geom_bar(stat="bin",fill="lightsteelblue1",binwidth=0.2)+theme_classic()+ggtitle('Bar Plot x')
  p2=ggplot(tbl,aes(x=y))+geom_bar(fill="rosybrown2")+theme_classic()+ggtitle('Bar Plot y')
  
  # pie plot
  a <- as.data.frame(summary(as.factor(tbl$z)))
  colnames(a) = c('value')
  a <- a %>%
    mutate(category = rownames(a)) %>%
    mutate(percentage = paste((round(value/sum(value),digits=3)*100),'%'))
  
  p3=ggplot(a, aes(x = "", y = value, fill = category)) +
    geom_col(color = "white") +
    geom_label(aes(label = percentage), 
               position = position_stack(vjust = 0.5),
               show.legend = FALSE) +
    guides(fill = guide_legend(title = "Category")) +
    scale_fill_viridis_d() +
    coord_polar(theta = "y") + 
    theme_void()+ggtitle('Pie Chart z')
  
  p4=ggplot(tbl,aes(x=a))+geom_bar(fill="navajowhite3")+theme_classic()+ggtitle('Bar Plot a')
  
  # combine plots
  print((p2|p3)/(p1|p4))

}else{
  print("Please make sure input csv file contains 3 or 4 columns")
}
