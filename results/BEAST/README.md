## Contains BEAST Results


### What is BEAST, though?

[BEAST](http://beast.community/) (Bayesian Evolutionary Analysis Sampling Trees) is software implemented in Java for analyzing molecular sequences using MCMC. [BEAST2](http://www.beast2.org/) also available. Both use MCMC "to average over tree space, so that each tree is weighted proportional to its posterior probability." <sup>1</sup> I can't get either to work so we shall see how this pans out.

### [Summary of BEAST 2.5](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1006650)

Extends [Felsenstein's likelihood](https://link.springer.com/article/10.1007%2FBF01734359) which builds evolutionary trees from DNA sequences. BEAST software can be used for any form of molecular sequence, and can be used with data that includes geographical or time data.

MCMC samples from the posterior distribution P(T,Θ|D) ∝ P(D|T,Θ)P(T|Θ)P(Θ) using the random-walk Metropolis-Hastings algorithm.

- T is: the phylogenetic structure (**T**ree)
- D is: the sequence (+ any other) **D**ata
- Θ is: the parameters including those for:
  - the collection of the phylodynamic model,
  - the substitution, 
  - site, and 
  - branch rate sub-models.
  
It samples using MCMC to average over the space of possible trees, and weights these trees proportional to posterior probability.

There are a buncha different packages which extend the capabilities of BEAST / BEAST 2, including many specific to epidemiologic data. 

### Usage notes (mac specific):

BEAST(v.1.10.4) requires java (Apple java 6 / Oracle java 8, may not work for newer versions)

Also requires download of [BEAGLE](http://beast.community/beagle) for usage noted here.

Files require xml formatting to be run on BEAST. .txt files in FASTA format can be run through [BEAUti](http://beast.community/programs) (Bayesian Evolutionary Analysis Utility.), which is included in the BEAST distribution and also allows parameter tuning.



#### References:

<sup>1</sup> [Beast2](http://www.beast2.org/)
