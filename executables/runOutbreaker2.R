library(outbreaker2)

# https://cran.r-project.org/web/packages/outbreaker2/outbreaker2.pdf

# load fake_outbreak data
# is a dataset of 30 separate DNA sequences of length 10000
fakeOutbreak = data(fake_outbreak)

# data that can be used from this fake outbreak
sample = as.matrix(fake_outbreak$sample) # dates of isolation
dnaSeq = as.matrix(fake_outbreak$dna) # (fake) pathogen genome sequences
onset = as.matrix(fake_outbreak$onset) # dates of onset
w = fake_outbreak$w #empirical distribution of generation time
ances = fake_outbreak$ances # true infectors (i.e. true ancestors)
ctd = fake_outbreak$ctd # contact tracing data




