## Contains <i>outbreaker2</i> Results


### What is outbreaker2, though?

[outbreaker2](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-018-2330-z) is an extension to the R package <i>outbreaker</i>. Its goal is to reconstruct outbreak transmission trees, while allowing users to tune model parameters.

These parameters can be custom prior distributions, custom likelihood functions and custom movement functions. It operates under Bayesian framework, using MCMC sampling to maximize some genetic pseudo-likelihood and epidemiologic pseudo-likelihood. Additional, confusing math is described [here](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1003457).

### Usage notes:

It's in R. library(outbreaker2) should be enough to import it. 

<i>outbreaker2</i> has a built-in fake_outbreak which contains 30 samples, and is used between algorithms.

It takes a long time depending on how outbreaker function is used. [runOutbreaker2.R](https://github.com/mbjorner/outbreak_trace/blob/main/executables/runOutbreaker2.R) displays current attempts as shamelessly copied (and tweaked!) from the [outbreaker2 R documentation](https://cran.r-project.org/web/packages/outbreaker2/outbreaker2.pdf).

