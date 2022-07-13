## sc-DCTM
Analysing scRNA-seq data using DCTM 

### Setup
To run the experiments, follow the steps below:

* Clone this repository and install the necessary dependencies: 
```
pip install -r requirements.txt
```

* Clone the dctm repository and install dctm:
```
git clone https://github.com/spotify-research/dctm.git
cd dctm
pip install . 
```


### DCTM in scRNA-seq

In the context of scRNA-seq, cells correspond to documents and genes to words. Topics are groups of genes that co-vary. Since we need document ordering, cells are ordered in pseudotime. You can use any pseudotime method as long as it produces global orderings of cells on a continuous non-branching trajectory. 


### Some considerations

1. Currently the DCTM formulation does not allow modelling of branching data, so it can only be used on linear or circular trajectoris. 


2. While DCTM is a very flexible model, we recommend using prior knowledge and understanding of your biological system to decide what kernels to use but also to determine if topic or word probabilities (or both) changing will allow for more intuitive and interpretable model.


### Summary of experiments 

1. Ordered vs randomised experiments: highlights that assumming the pseudotime is capturing an underlying biological process, DCTM is sensitive to this signal. 

2. Comparison between DCTM, LDA, and Relaxed LDA using Malaria Cell Atlas datas. In the case of the Malaria Cell Atlas, we are pushing the complexity of the dataset in the topics as they will be changing more quickly as we are working with different cell types. Thus, words are modelled with Matern 1/2 with amplitude and leghtscale set to 1 and 7.5 respectively. Document-topic probabilities are modelled as GP with exponential quadratic kernel, amplitude and legthscale set to 1 and 0.5 respectively. 

3. Application of DCTM to dendritic cells dataset 


