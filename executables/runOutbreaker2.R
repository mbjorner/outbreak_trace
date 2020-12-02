library(outbreaker2)

# https://cran.r-project.org/web/packages/outbreaker2/outbreaker2.pdf

# load fake_outbreak data
# is a dataset of 30 separate DNA sequences of length 10000
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
dat2 = mySim
                                                                # w as found in dat
out2 = outbreaker(data = list(dna = dat2$seq, dates = dat2$dates, w_dens = dat$w),
                 config = list(n_iter = 2e3, sample_every = 200))
plot(out2)
random_diffusion = as.data.frame(out2)

random_diffusion_table = summary(out2)$tree

write.csv(random_diffusion_table, '~/Documents/GitHub/outbreak_trace/results/outbreaker2/random_diffusion_outbreaker2_results.csv')





