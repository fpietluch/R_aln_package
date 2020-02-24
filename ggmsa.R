library(ggmsa)
library(ggplot2)
library(ggtree)

#sequences <- system.file("extdata", "sample.fasta", package = "ggmsa")
sequences <- "/home/filip/Pulpit/ATPA.ALN"
#20x30 wymiar pdf.
#Do tego nie można zaznaczać sekwencji. 
#na plus dużo opcji kolorowania od fizykochemicznych po występujace w różnych programach
#naplus możliwe szykie wyliczenie drzewa i porównanie go z sekwencjami
p8<-ggmsa(sequences, font="roboto_bold" , 320, 360, color = "Taylor_AA") # nie wyświetla nazw jak wyświetla aa ... 
p9<-ggmsa(sequences, 320, 400, font = NULL, color = "Chemistry_AA")
#------------
library(Biostrings)
x <- readAAStringSet(sequences)
d <- as.dist(stringDist(x, method = "hamming")/width(x)[1])
library(ape)
tree <- bionj(d) #wyliczenie drzewa
library(ggtree)

p <- ggtree(tree) + geom_tiplab() # narysowanie gałęzi oraz nałożenie nazw gatunków
p
data = tidy_msa(x,120,160)

p + geom_facet(geom = geom_msa, data = data,  panel = "msa",
               font = NULL, color = "Chemistry_AA") +
  xlim_tree(xlim = 1)

#---------------

#cięzko ustawić wielkość loga, tak samo jest ze skalowaniem nazw org a sekwencji o braku możliwości kopiowania pozycji z aln nie wspomne
#może zrobić opcję zapisu, że np. mamy sekwencje, wizualizujemy i możemy jako fasta zapisać interesujący nas zakres wraz z nagłówkami
s <- readAAStringSet(sequences)
strings <- as.character(s)
p1 <- ggmsa(s, 100,110,  color = 'Chemistry_AA')

library(ggseqlogo)
library(cowplot)

p2 <- axis_canvas(p1, axis='x')+ geom_logo(strings, 'probability') 
pp <- insert_xaxis_grob(p1, p2, position="top", grid::unit(0.09, "null"))
ggdraw(pp)
