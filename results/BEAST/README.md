## Contains BEAST Results


### What is BEAST, though?

[BEAST](http://beast.community/) (Bayesian Evolutionary Analysis Sampling Trees) is software implemented in Java for analyzing molecular sequences using MCMC. [Beast2](http://www.beast2.org/) also available but currently unused in outbreak_trace. Both use MCMC "to average over tree space, so that each tree is weighted proportional to its posterior probability." <sup>1</sup> 

### Usage notes (mac specific):

BEAST(v.1.10.4) requires java (Apple java 6 / Oracle java 8, may not work for newer versions)

Also requires download of [BEAGLE](http://beast.community/beagle) for usage noted here.

Files require xml formatting to be run on BEAST. .txt files in FASTA format can be run through [BEAUti](http://beast.community/programs) (Bayesian Evolutionary Analysis Utility.), which is included in the BEAST distribution and also allows parameter tuning.



#### References:

<sup>1</sup> [Beast2](http://www.beast2.org/)
