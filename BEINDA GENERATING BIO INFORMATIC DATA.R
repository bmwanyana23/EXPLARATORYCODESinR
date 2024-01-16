R Codes for generating Bioinformaticas Data

#Generate new data set with 3 variables - multivariate data
data_3l=data_clean[c("sales","resale","price")]
data_3l=data.matrix(data_3l)

length(data_3l)

#Generating Bioinformatics Data

#generating sequence of characters for the length of data_3l
nucle=letters[seq( from = 1, to = 351 )]

nu2=LETTERS[(1:351 %% 5 > 1) + 1]
length (nu2)

#bioinformatics data
seq_data=data.frame(data_3l,nu2)




#vector c("T", "A", "C", "G") for genomic data
x <- c("T", "A", "C", "G")
do.call(expand.grid, rep(list(x), 3))

#using permutations
library(gtools)
data <-  c("T", "A", "C", "G")
permutations(4, 3, data, repeats.allowed = TRUE)



#combinations
# generating combinations of the 
# alphabets taking 2 at a time
library(combinat)
combn(letters[1:4], 2)


#letters from 1(a) to 10(j)
prm <- gtools::permutations(n=10, r=3, v=LETTERS[1:10])
#selecting 351 observations
prm_up=apply(prm, 1, function(x)paste0(x, collapse=''))
prm_1=prm_up[1:351]


#bioinformatics data
bio_data=data.frame(data_3l,prm_1)
head(bio_data,3)

#apply DNA Sequencing Statistics
#length
length(bio_data)
length(prm_up)

table(prm_up)

GC(prm_up)

count(prm_up, 1)


count(prm_up, 2)
