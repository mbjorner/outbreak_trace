## Results using the online implementation of [PhyML](http://www.atgc-montpellier.fr/phyml/). 

This can also be accomplished with the [PhyML R implementation](https://www.rdocumentation.org/packages/ape/versions/5.4-1/topics/phymltest) which uses the [ape](https://cran.r-project.org/web/packages/ape/ape.pdf) package in R.

This method **does not** make use of time-series data, and relies upon genetic differences.

### What is PhyML, though?

PhyML is "**Phy**logeny software based on the **M**aximum-**L**ikelihood principle"<sup>1</sup>

### Results:

PhyML's integrated SMS (model selection) found GTR to be the best model for the data. GTR is the general time-reversible model.

Visualizations:

[HA](http://www.atgc-montpellier.fr/presto/index.php?tree=20201130-011320_Wv25/h1n1_ha_sequences_txt_alter_phy_phyml_tree.txt). 

Link might be dead, depending on how long these are kept. No worries, though. Can re-run with file h1n1_ha_sequences.txt.alter.phy as found in H1N1 data.

[NA](http://www.atgc-montpellier.fr/presto/index.php?tree=20201130-012900_Jg78/h1n1_na_sequences_txt_alter_phy_phyml_tree.txt)

Link might be dead, depending on how long these are kept. No worries, though. Can re-run with file h1n1_na_sequences.txt.alter.phy as found in H1N1 data.

#### References: 

<sup>1</sup> [New Algorithms and Methods to Estimate Maximum-Likelihood Phylogenies: Assessing the Performance of PhyML 3.0](http://www.atgc-montpellier.fr/download/papers/phyml_2010.pdf)
