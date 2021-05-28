# 基因与化学分子关联（摘要共句）分析脚本
# 作者：余思克，华中农业大学信息学院，武汉，湖北，中国
# 使用说明：运行之前请关注自己的文件地址信息是否与与脚本一致

import pandas as pd

with open('../preparing_data/covid_19_entity_result_abstract.txt', 'r', encoding = 'UTF-8') as file:
    abstract = file.read() # 读取文献abstract信息

gene_list = pd.read_csv('../result/result_data/gene_entity.txt', header = None) # 读取基因实体文件
chemical_list = pd.read_csv('../result/result_data/chemical_entity.txt', header = None) # 读取化学分子实体文件

sentences = list()
sentences = abstract.split('.') # 按英语句号分割摘要文件，每一句话作为一个独立的单位。

relation = pd.DataFrame()
relation_freq = pd.DataFrame()

for gene in gene_list[0]:
    for chemical in chemical_list[0]:
        print('Gene :', gene, 'chemical :', chemical)
        for sentence in sentences:
            if gene in sentence and chemical in sentence:
                relation = relation.append({'gene':gene, 'relation': 'relate','chemical':chemical}, ignore_index=True) # 计算基因与化合物的共句信息

relation_freq = relation
relation_freq['count'] = 1
relation_freq = relation_freq.groupby(['gene', 'chemical', 'relation'])['count'].sum().reset_index().sort_values('count', ascending = False).reset_index(drop = True)
relation_freq = relation_freq[relation_freq['count'] > 100]

relation = relation_freq[['gene', 'relation', 'chemical']] # 数据清洗得到用于绘制关系网络图的数据格式
relation_freq = relation_freq.drop(['relation'], axis = 1) # 得到高频共句的基因与化学分子

relation.to_csv('../result/result_data/relation.sif', sep = '\t', header = False, index = None)
relation_freq.to_csv('../result/result_data/relation_freq.txt', sep = '\t', header = True, index = None) # 结果输出到文件