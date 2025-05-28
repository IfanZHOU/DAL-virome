library(pheatmap)
rm(list=ls())
data <- read.table("AA_usage.csv",sep=",", header=T, row.names=1, check.names = F)

pheatmap(data, 
         cluster_rows = T, cluster_cols = F, cutree_rows= 4,
         legend = T,
         border_color = "gray80",
         fontsize = 9,
         cellwidth = 11,
         cellheight = 11,
         
)