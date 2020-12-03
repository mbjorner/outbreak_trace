### Graph visualizations of output:

#### The following are 4 images to represent the ancestral relationships of fake_outbreak. 

The first is a representation of the true ancestry relationships
![True graph](true_graph.png?raw=true "true graph")

This is a visualization of the output of outbreaker2. This graph had the highest F-score, of 0.97.
![outbreaker2 graph](outbreaker2_graph.png?raw=true "outbreaker2 graph")

This is a visualization of the output of seqTrack. This graph had the second highest F-score, of 0.90.
![seqTrack graph](seqTrack_graph.png?raw=true "seqTrack graph")

This is a visualization of the output of PhyML. This is created using a rough translation of the phylogenetic graph structure into a tree. Where there were multiple possible parents, PhyML was given the benefit of the doubt. If the true parent was in the group of possible parents (as indicated by the same genetic distance), the true parent was chosen as the ancestor. Even with this adjustment, the PhyML output had the lowest F-score, of 0.78. This is expected, as no time data was given to distinguish between genetically identical samples.
![PhyML graph](PhyML_graph.png?raw=true "PhyML graph")



note: Connection to NA implies the root of the graph, and no ancestor. Treat any nodes connected to NA as the root of their own tree.
