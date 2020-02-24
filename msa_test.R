library(msa)
#LATEX package TEXshade wykorzystuje do wyświetlania 
system.file("tex", "texshade.sty", package="msa")
# odnalezienie pliku z pakietu
mySequenceFile <- system.file("examples", "exampleAA.fasta", package="msa") 
#odczytanie pliku, z wykorzystaniem funkcji BioStrings - utworzenie list elementów (zliczone znaki, sekwencja , nazwa)
mySequences <- readAAStringSet(mySequenceFile) 
mySequences

myFirstAlignment <- msa(mySequences)
print(mySequences)
print(myFirstAlignment, show="complete")

msaPrettyPrint(, y=c(1, 213), output="pdf",
               showNames="none", showLogo="top", askForOverwrite=TRUE)

msaPrettyPrint(myFirstAlignment, y=c(164, 213), output="asis",
               showNames="none", showLogo="none", askForOverwrite=FALSE)

#---------------------
myAligment_ATPA <-readAAStringSet("/home/filip/Pulpit/ATPA.ALN")
ATPA<-msa(myAligment_ATPA)
ATPA
msaPrettyPrint(ATPA, output = ,y=c(5, 10),subset=c(100:106),
               showNames="left", showLogo="top",
               logoColors="rasmol", shadingMode = "identical",
               showLegend=TRUE, askForOverwrite=FALSE)

