library(Seurat)
library(dplyr)
library(Matrix)
library(presto)

raw_counts<-read.csv("pb10xIDC_counts.csv",sep=",",header=TRUE, row.names=1)

head(raw_counts)

mydata <- CreateSeuratObject(counts = raw_counts, project = "mydata_scRNAseq")

mydata <- NormalizeData(mydata)

mydata <- FindVariableFeatures(mydata, selection.method = "vst", nfeatures = 2000)

all.genes <- rownames(mydata)
mydata <- ScaleData(mydata, features = all.genes)
mydata <- RunPCA(mydata, features = VariableFeatures(object = mydata))
DimPlot(mydata, reduction = "pca")
mydata <- FindNeighbors(mydata, dims = 1:10)
mydata <- FindClusters(mydata, resolution = 1.12)
mydata<- RunUMAP(mydata, dims = 1:10)
DimPlot(mydata, reduction = "umap")

mydata.markers <- FindAllMarkers2(mydata,logfc.threshold = 0,min.diff.pct = 0,min.pct = 0)



mydata.markers %>%
  group_by(cluster) %>%
  slice_max(n = 100,order_by=avg_logFC)

genes <- wilcoxauc(mydata, 'seurat_clusters')


write.csv(genes, file="PBrankedgenes.csv")




