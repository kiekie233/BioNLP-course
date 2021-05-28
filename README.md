# BioNLP-course
This is a repositories about BioNLP course including 7 tasks and 1 course project for study.

## Course project

The course project use a BioNLP tools named PubTator combined with an analysis pipeline built by us in order to solve a text mining problem about Covid-19 research papers. We have drawn the flow chart and upload it to describe the project pipeline.

### Data preparing and preprocessing

Original data in this project is an entity file comes from PubTator tool, by which a series of abstracts of research papers in PubMed database is processed.

The entity file comprise 3 part, the first part is the title of the paper, the second one is the abstract of it, and the last one is the entity data of it. In this project, we mainly focus on the abstract part and the entity part.

Original data can be obtained and preprocessed through the **shell** script named "**get_entity.sh**". By running this script, the entity file named "**covid_19_entity_result.txt**" will be obtained by PubTator API through an uid list which is the ID of research paper about the key word "Covid-19". after obtained the entity file, the script will secondly extract the entity and abstract data from it. Their name is "**covid_19_entity_result_entity.txt**"and "**covid_19_entity_result_abstract.txt**". 

```shell
bash get_entity.sh # data obtaining and preprocessing
```

By the way, the data preparing is a time-consuming process, so we have uploaded the zip file of the data and you can download it and unzip it so as to save the time.

### Entity word frequency statistics

In this part, we will count the word frequency of different type of entity, such as "gene", "chemical", "disease", "SNP" and so on. According to the frequency data, we will draw the word cloud to visualize it. 

This part is implemented by **R** language, and the "wordcloud2" package is needed to be install before.

```shell
Rscript Get_entity_freq.R # Entity word frequency statistics
```

In addition, this part will also export two list whose name is "**gene_entity.txt**" and "**chemical_entity.txt**" about "gene" and "chemical" entity in order to do next analysis.

### Entity relation analysis

In this part, we will do the relation analysis about "gene" and "chemical" entity so as to find potential relation between them. We defined the relation of two entities by the co-sentence analysis. the strategy is to judge whether the "gene" entity word and "chemical" entity word appear in the same sentence.

This part is implemented by **Python** language, and the "pandas" package is needed to be install before.

```shell
Get_entity_relation.py # Entity relation analysis
```

As a result, two file will be export through the python script, one is the co-sentence relation frequency table that record the count of co-sentence about the "gene" entity word and  the "chemical" entity word named "**relation_freq.txt**", the other is a file named "**relation.sif**" in "SIF" format to record the relation of to nodes, which will be used to draw the relation network about "gene" entities and "chemical" entities by **Cytoscape 3.8.2**.

### Further research

After getting the data above, we can do further research such as gene function analysis, mutation or SNP influences analysis,  Covid-19 infection characteristics analysis and so on. 

The project is at the end. Go and develop your divergent thinking!

## Course tasks

This part contains 7 tasks about practice of BioNLP technic, including TTR analysis, word frequency analysis, GO enrichment analysis, sequence labeling, embedded computing and so on.

The directories contain 7 experiment reports in "PDF" format, you can download the "PDF" file and read it.

 
