library(adegenet)
library(ape)

## Sources:
# dist.dna function
# https://www.rdocumentation.org/packages/ape/versions/3.0-9/topics/dist.dna

# seqTrack algorithm for reconstructing genealogies:
# https://www.rdocumentation.org/packages/adegenet/versions/2.0.1/topics/seqTrack
# http://adegenet.r-forge.r-project.org/files/seqTrack-practical.1.3.pdf

## load data
setwd("~/Documents/GitHub/outbreak_trace/datasets/simulated_datasets")
load('fakeOutbreak.1.RData') # named fake_outbreak
load('sim.unif.1.RData')     # named mySim

## computing nucleotide distances
# to calculate raw pairwise genetic distances between isolates,
# ape package can be used (dist.dna)
nbNucleotide = ncol(as.matrix(fake_outbreak$dna))
distances    = dist.dna(fake_outbreak$dna, model = "raw")*ncol(as.matrix(fake_outbreak$dna))
distances    = round(as.matrix(distances))

## spatial connectivity matrix - no geographical information
# xy = cbind(dat$lon, dat$lat)
# temp = as.matrix(dist(xy))
# M = 1 * (temp < 1e-10)

## SEQTRACK! 
mu1 = 0.00502/365
fake_outbreak$onset = as.POSIXct(as.Date(fake_outbreak$onset, origin = "1970-01-01"))
fake_outbreak_results  = seqTrack(distances, rownames(fake_outbreak), fake_outbreak$onset, prox.mat= NULL, mu=mu1, haplo.le = nbNucleotide)  
# saves inferred ancestry information as a dataframe of seqTrack class

write.csv(fake_outbreak_results, '~/Documents/GitHub/outbreak_trace/results/seqTrack/fake_outbreak_seqTrack_results.csv')


## Genetic likelihood
p = get.likelihood(results, mu=mu1, haplo.length=nbNucleotide)

g = plot(fake_outbreak_results, main = "SeqTrack reconstruction of outbreaker2's fake_outbreak")
mtext(side = 3, text = "read: no/few mutations; grey: many mutations") 

head(results)
tail(results)
range(results$weight, na.rm=TRUE)
barplot(table(results$weight)/sum(!is.na(results$weight)), ylab="Frequency",
        xlab="Mutations between inferred ancestor and descendent", col="orange")
