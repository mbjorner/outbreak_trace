library(adegenet)
library(ape)

## Sources:
# dist.dna function
# https://www.rdocumentation.org/packages/ape/versions/3.0-9/topics/dist.dna

# seqTrack algorithm for reconstructing genealogies:
# https://www.rdocumentation.org/packages/adegenet/versions/2.0.1/topics/seqTrack
# http://adegenet.r-forge.r-project.org/files/seqTrack-practical.1.3.pdf

## load data
setwd("~/Documents/GitHub/outbreak_trace/datasets/H1N1_dataset")
dat = read.csv("H1N1_temporospatial.csv", sep= ",", header = T)       # package = "adegenet" unused.
ha  = read.dna("H1N1_HA_sequences.txt", format="fa")
na  = read.dna("H1N1_NA_sequences.txt", format="fa")

## computing nucleotide distances
# to calculate raw pairwise genetic distances between isolates,
# ape package can be used (dist.dna)
nbNucleotide = ncol(as.matrix(ha)) + ncol(as.matrix(na))
distances    = dist.dna(ha, model = "raw")*ncol(as.matrix(ha)) +
               dist.dna(na, model = "raw")*ncol(as.matrix(na))
distances    = round(as.matrix(distances))

## spatial connectivity matrix
xy = cbind(dat$lon, dat$lat)
temp = as.matrix(dist(xy))
M = 1 * (temp < 1e-10)

## SEQTRACK! 
mu1 = 0.00502/365
dat$date = as.POSIXct(dat$date)
results  = seqTrack(distances, rownames(dat), dat$date, prox.mat=M, mu=mu1, haplo.le = nbNucleotide)  
# saves inferred ancestry information as a dataframe of seqTrack class

# save dataframe of results to csv file
write.csv(results, '~/Documents/GitHub/outbreak_trace/results/seqTrack/H1N1_seqTrack_results.csv')

## Genetic likelihood
p = get.likelihood(results, mu=mu1, haplo.length=nbNucleotide)

# kind of a mess when there are 433 nodes
g = plot(results, main = "SeqTrack reconstruction of the H1N1 outbreak")
mtext(side = 3, text = "read: no/few mutations; grey: many mutations") 

head(results)
tail(results)
range(results$weight, na.rm=TRUE)
barplot(table(results$weight)/sum(!is.na(results$weight)), ylab="Frequency",
        xlab="Mutations between inferred ancestor and descendent", col="orange")
