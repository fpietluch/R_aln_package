library(DECIPHER)
#generuje w sposób najwygodniejszy do przeglądarki, brakuje sequencelogo i nazw organizmów. Fajnie że ma sekwencję koncensuowa. Ładne kolory. 
# do wyboru było dna lub rna nie na aminokwasy. dlatego troszke brakowało funkcjonalności. warto pamiętać żeby uwzględnić każdy z tych 3 rodzajów sekw.
gen <- "/home/filip/Pulpit/ATPA.ALN"
dbConn <- dbConnect(SQLite(), ":memory:")
Seqs2DB(gen, "FASTA", dbConn, identifier = "Archaeplastida")
BrowseDB(dbConn)
SearchDB(type = "AAStringSet", dbConn)
BrowseDB(dbConn)
r <- SearchDB(dbConn, identifier="Archaeplastida")
BrowseSeqs(subseq(r, 1, 500))
d <- DistanceMatrix(r, correction="Jukes-Cantor", verbose=FALSE)
c <- IdClusters(d, method="ML", cutoff=.05, showPlot=TRUE, myXStringSet=RNAStringSet, verbose=FALSE)

