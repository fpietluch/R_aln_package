library(ggplot2)
#install.packages("alignfigR")
library(alignfigR)
sequences <- "/home/filip/Pulpit/ATPA.ALN"

#na plus legenda i skalowanie
my_data <- read_alignment(sequences)

plot_alignment(my_data, "protein")

plot_alignment(my_data, "protein", taxa = c("Euryale_ferox_Viridiplantae_Streptophyta", "Primula_veris_Viridiplantae_Streptophyta"))
