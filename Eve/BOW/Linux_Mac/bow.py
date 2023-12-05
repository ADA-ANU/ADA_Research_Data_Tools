import pandas as pd
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer
import nltk
from nltk.corpus import stopwords
import numpy as np
from numpy import dot, mat, matmul, ndarray
from numpy.linalg import norm
import pandas as pd
import os
import csv
import networkx as nx
import sys

input_file = sys.argv[1]
n_box = int(sys.argv[2])
threshold = float(sys.argv[3])
option = sys.argv[4]

#input_file = "input_var.csv"
#n_box = 3
#threshold = 0.7

"""takes an adjacency matrix and import it to networkx, undirected and directed now"""
def D_to_NXgraph(D):
    G = nx.Graph()
    nodes = range(D.shape[1])
    rows, cols = np.where(D > 0)
    edge_pos = zip(rows.tolist(), cols.tolist())
    edges = [(ind[0],ind[1],{'weight': D[ind[0],ind[1]]}) for ind in edge_pos]
    G.add_nodes_from(nodes)
    G.add_edges_from(edges)
    return G

##preprocessing: get rid of stop words. Then, calculate its frequency vector. Then, cosine similarity. N-grams is an interesting idea as well as a next step.
def process(corpus,n):
    nltk.download('stopwords')
    vectorizer = CountVectorizer(stop_words = stopwords.words('english'))
    sent_1 = vectorizer.fit_transform(corpus)
#    print(vectorizer.get_feature_names_out())
 #   print(sent_1.toarray())
#    print(sent_1)

    vectorizer2 = CountVectorizer(analyzer='word', ngram_range=(n, n))
    sent_2 = vectorizer2.fit_transform(corpus)
    return sent_1.toarray(), sent_2.toarray()

def cosine_similarity(vec1, vec2):
    dp = dot(vec1, vec2.T)
    m1 = mat(norm(vec1))
    m2 = mat(norm(vec2.T))
    return np.asarray(dp / matmul(m1.T, m2))

def sim_mat(sent):
    n = sent.shape[0]
    mat = np.zeros((n,n))
    for i in range(n):
        for j in range(i):
            mat[i,j] = mat[j,i] = cosine_similarity(sent[i,:],sent[j,:])
    print(mat)
    return mat

def get_rows_cols(mat,threshold):
    rows, cols = np.where(mat > threshold)
    return rows, cols

def mat_for_graph(mat,rows,cols):
    n = mat.shape[0]
    graphmat = np.zeros((n,n))
    for row,col in zip(rows,cols):
        graphmat[row,col] = 1
    return graphmat

 
def writer(name,corpus,sent,threshold,option):
    mat = sim_mat(sent)
    rows,cols = get_rows_cols(mat,threshold)
    graphmat = mat_for_graph(mat,rows,cols)
    G = D_to_NXgraph(graphmat)
    if option == "exact":
        connected_components = list(nx.find_cliques(G))
    elif option == "fuzzy":
        connected_components = sorted(nx.connected_components(G), key=len, reverse=True)
    with open(name, mode='w', newline='') as file:
         writer = csv.writer(file)
         for cc in connected_components:
             if len(cc)>1:
                writer.writerow(["row number","row content"])
                for c in cc:
                    writer.writerow([c,corpus[c]])
                writer.writerow([""])


def test():
    data = pd.read_csv(input_file)
    corpus = data['VariableLabel']
    sent_1, sent_2 = process(corpus,n_box)
    writer(f"output_{n_box}gram_{option}.csv",corpus,sent_2,threshold,option)
    writer(f"output_bow_{option}.csv",corpus,sent_1,threshold,option)
 
test()
