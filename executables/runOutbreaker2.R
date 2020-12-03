library(outbreaker2)

# https://cran.r-project.org/web/packages/outbreaker2/outbreaker2.pdf

# load fake_outbreak data
# is a dataset of 30 separate DNA sequences of length 10000

setwd("~/Documents/GitHub/outbreak_trace/datasets/simulated_datasets")
data(fake_outbreak)
dat = fake_outbreak

# data that can be used from this fake outbreak
sample = as.matrix(fake_outbreak$sample) # dates of isolation
dnaSeq = as.matrix(fake_outbreak$dna) # (fake) pathogen genome sequences
onset = as.matrix(fake_outbreak$onset) # dates of onset
w = fake_outbreak$w # empirical distribution of generation time
ances = fake_outbreak$ances # true infectors (i.e. true ancestors)
ctd = fake_outbreak$ctd # contact tracing data


# save(fake_outbreak, file=paste("fakeOutbreak", ----, "RData", sep="."))

out = outbreaker(data = list(dna = dat$dna, dates = dat$onset, w_dens = dat$w),
                config = list(n_iter = 2e4, sample_every = 200))
plot(out)
fake_outbreak_results = as.data.frame(out)
fake_outbreak_table = summary(out)$tree

write.csv(fake_outbreak_table, '~/Documents/GitHub/outbreak_trace/results/outbreaker2/fake_outbreak_outbreaker2_results.csv')


# requires loading simulated data into workspace (as found in outbreak_trace/datasets/)
load('sim.unif.1.RData')
dat2 = mySim
                                                                # w as found in dat
out2 = outbreaker(data = list(dna = dat2$seq, dates = dat2$dates, w_dens = dat$w),
                 config = list(n_iter = 2e3, sample_every = 200))
plot(out2)
random_diffusion = as.data.frame(out2)

random_diffusion_table = summary(out2)$tree

write.csv(random_diffusion_table, '~/Documents/GitHub/outbreak_trace/results/outbreaker2/random_diffusion_outbreaker2_results.csv')


# H1N1 dataset
setwd("~/Documents/GitHub/outbreak_trace/datasets/H1N1_dataset")
library(ape)
dath1n1 = read.csv("H1N1_temporospatial.csv", sep= ",", header = T)       # package = "adegenet" unused.
ha  = read.dna("H1N1_HA_sequences.txt", format="fa")
na  = read.dna("H1N1_NA_sequences.txt", format="fa")

h1n1 = cbind(ha, na) # this will have fully known consequences, where the concatenated samples
# do not match up to their corresponding sequences. However, this is done here for the 
# purpose of assessing speed.

dath1n1$date = as.POSIXct(dath1n1$date)
dath1n1$date = as.numeric(dath1n1$date)
out3 = outbreaker(data = list(dna = ha, dath1n1$date, w_dens = dat$dat), #err: DNA sequence labels don't match case ids.
                  config = list(n_iter = 2e3, sample_every = 200))
plot(out3)
h1n1_outbreaker = as.fata.frame(out3)

h1n1_outbreaker_table = summary(out3)$tree

write.csv(h1n1_outbreaker_table, '~/Documents/GitHub/outbreak_trace/results/outbreaker2/h1n1_outbreaker2_results.csv')





