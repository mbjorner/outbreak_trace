# goal: convert these data frames DNAbin objects into fasta files
library(ape)

write.dna(fake_outbreak$dna, file = 'fake_outbreak.fasta', format = 'fasta')
write.dna(mySim$seq, file = 'random_diffusion.fasta', format = 'fasta')
