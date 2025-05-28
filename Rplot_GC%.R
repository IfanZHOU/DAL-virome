df <- read.csv("GC_content.csv")

df$Halo <- as.numeric(sub("%", "", df$Halo))
df$HaloV <- as.numeric(sub("%", "", df$HaloV))
df$Nanohalo <- as.numeric(sub("%", "", df$Nanohalo))
df$NanohaloV <- as.numeric(sub("%", "", df$NanohaloV))


library(ggplot2)

ggplot(df) +
    geom_boxplot(aes(x = factor(1), y = Halo), fill = "red", size = 0.5, outlier.shape = NA) +
    geom_jitter(aes(x = factor(1), y = Halo), color = "red3", size = 0.86, width = 0.3) +
    geom_boxplot(aes(x = factor(2), y = HaloV), fill = "red", size = 0.5, outlier.shape = NA) +
    geom_jitter(aes(x = factor(2), y = HaloV), color = "red3", size = 0.90, width = 0.26) +
    geom_boxplot(aes(x = factor(3), y = Nanohalo), fill = "pink1", size =0.5, outlier.shape = NA) +
    geom_jitter(aes(x = factor(3), y = Nanohalo), color = "pink3", size = 0.92, width = 0.25) +
    geom_boxplot(aes(x = factor(4), y = NanohaloV), fill = "pink1", size =0.5, outlier.shape = NA) +
    geom_jitter(aes(x = factor(4), y = NanohaloV), color = "pink3", size =0.94, width = 0.24) +
    scale_x_discrete(labels = c('Halo', 'HaloV', 'Nanohalo', 'NanohaloV')) +
    labs(x = NULL, y = "Value") +
    theme_minimal() +
    theme(legend.position = "none") 