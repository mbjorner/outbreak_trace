# This is a sample Python script.

# Press ⌃R to execute it or replace it with your code.
# Press Double ⇧ to search everywhere for classes, files, tool windows, actions, and settings.
import networkx as nx
import matplotlib.pyplot as plt
import urllib
import csv



def produce_graph(name):
    nx.draw_networkx(name, with_labels=True)
    plt.show()


# Press the green button in the gutter to run the script.
if __name__ == '__main__':

    edgesTrue = nx.read_edgelist("valid_ancestors_fake_outbreak.txt")
    edgesOutbreaker2 = nx.read_edgelist("outbreaker2_proposed_ancestors_fake_outbreak.txt")
    edgesPhyML = nx.read_edgelist("PhyML_proposed_ancestors_fake_outbreak.txt")
    edgesseqTrack = nx.read_edgelist("seqTrack_proposed_ancestors_fake_outbreak.txt")

    produce_graph(edgesseqTrack)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
