## Results using the online implementation of [PhyML](http://www.atgc-montpellier.fr/phyml/). 

This can also be accomplished with the [PhyML R implementation](https://www.rdocumentation.org/packages/ape/versions/5.4-1/topics/phymltest) which uses the [ape](https://cran.r-project.org/web/packages/ape/ape.pdf) package in R.

This method **does not** make use of time-series data, and relies upon genetic differences.

### What is PhyML, though?

PhyML is "**Phy**logeny software based on the **M**aximum-**L**ikelihood principle"<sup>1</sup>

The original PhyML algorithm performed simulateous Nearest Neighbor Interchanges (NNIs) to improve a reasonable starting tree that was usually calculated with parsimony/distance methods. This NNI method is fast!

However, cons of NNI include traps in suboptimal local maxima, especially when working with larger/difficult data sets. In turn PhyML-SPR (subtree pruning and regrafting) was developed as an alternative to NNI.

The likelihood function is estimated with each local change (instead of global computation, which would be more computationally inefficient) to land upon a local maxima, that hopefully approximates the global one to find the best tree structure. It compares moves with Phy-aLRT (an approximate likelihood ratio test), and takes the move which will best improve the (log-)likelihood score, (which can also be considered a minimization of the parsimony scores) if one is available.

### Results:

#### H1N1

PhyML's integrated SMS (model selection) found GTR to be the best model for the data. GTR is the general time-reversible model.

Visualizations:

[HA](http://www.atgc-montpellier.fr/presto/index.php?tree=20201130-011320_Wv25/h1n1_ha_sequences_txt_alter_phy_phyml_tree.txt). Link might be dead, depending on how long these are kept. No worries, though. Can re-run with file h1n1_ha_sequences.txt.alter.phy as found in H1N1 data.

[NA](http://www.atgc-montpellier.fr/presto/index.php?tree=20201130-012900_Jg78/h1n1_na_sequences_txt_alter_phy_phyml_tree.txt). Link might be dead, depending on how long these are kept. No worries, though. Can re-run with file h1n1_na_sequences.txt.alter.phy as found in H1N1 data.

files ending in '_tree.txt' contain [Newick format](https://evolution.gs.washington.edu/phylip/newicktree.html) structures that can be imported to visualization systems.

#### References: 

<sup>1</sup> [New Algorithms and Methods to Estimate Maximum-Likelihood Phylogenies: Assessing the Performance of PhyML 3.0](http://www.atgc-montpellier.fr/download/papers/phyml_2010.pdf)
