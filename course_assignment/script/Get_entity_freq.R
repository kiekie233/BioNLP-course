library(wordcloud2)

data = read.csv('../preparing_data/covid_19_entity_result_entity.txt', sep = "\t", header = F, stringsAsFactors = F, quote = "")
entity = data.frame(entity = data$V4, bioconcep = data$V5)
entity$entity = tolower(entity$entity)
entity_list = c(entity$entity)
freq = table(entity_list)
freq = data.frame(freq)
names(freq)[1] = "entity"
freq$entity = as.character(freq$entity)
freq$Freq = as.integer(freq$Freq)
freq = merge(freq, entity, by = "entity")
freq = freq[!duplicated(freq$entity), ]
order_temp = order(freq$Freq, decreasing = T)
freq = freq[order_temp,]
rownames(freq) = seq(1,nrow(freq)) # 数据清洗，统计实体词频

disease = freq[freq$bioconcep == "Disease" & freq$Freq >= 100, ]
order_temp = order(disease$Freq, decreasing = T)
disease = disease[order_temp,]
rownames(disease) = seq(1,nrow(disease))
disease$Freq = disease$Freq ^ 0.3
wordcloud2(disease[seq(1,75),], size = 0.55)

species = freq[freq$bioconcep == "Species" & freq$Freq >= 100, ]
order_temp = order(species$Freq, decreasing = T)
species = species[order_temp,]
rownames(species) = seq(1,nrow(species))
species$Freq = species$Freq ^ 0.3
wordcloud2(species[seq(1,75),], size = 0.6)


gene = freq[freq$bioconcep == "Gene" & freq$Freq >= 100, ]
order_temp = order(gene$Freq, decreasing = T)
gene = gene[order_temp,]
rownames(gene) = seq(1,nrow(gene))
gene$Freq = gene$Freq ^ 0.4
wordcloud2(gene, size = 0.6)

chemical = freq[freq$bioconcep == "Chemical" & freq$Freq >= 100, ]
order_temp = order(chemical$Freq, decreasing = T)
chemical = chemical[order_temp,]
rownames(chemical) = seq(1,nrow(chemical))
chemical$Freq = chemical$Freq ^ 0.5
wordcloud2(chemical[seq(1,75),], size = 0.45)

protein_mutation = freq[freq$bioconcep == "ProteinMutation", ]
order_temp = order(protein_mutation$Freq, decreasing = T)
protein_mutation = protein_mutation[order_temp,]
rownames(protein_mutation) = seq(1,nrow(protein_mutation))
protein_mutation$Freq = protein_mutation$Freq ^ 0.3
wordcloud2(protein_mutation[seq(1,75),], size = 0.6)

DNA_mutation = freq[freq$bioconcep == "DNAMutation", ]
order_temp = order(DNA_mutation$Freq, decreasing = T)
DNA_mutation = DNA_mutation[order_temp,]
rownames(DNA_mutation) = seq(1,nrow(DNA_mutation))
DNA_mutation$Freq = DNA_mutation$Freq ^ 0.8
wordcloud2(DNA_mutation[seq(1,75),], size = 0.8)

snp = freq[freq$bioconcep == "SNP", ]
order_temp = order(snp$Freq, decreasing = T)
snp = snp[order_temp,]
rownames(snp) = seq(1,nrow(snp))
wordcloud2(snp[seq(1,75),], size = 0.7) # 各实体词云绘制

write.table(gene$entity, file = "../result/result_data/gene_entity.txt", quote = F, sep = "\n", row.names = F, col.names = F) # gene实体数据输出
write.table(chemical$entity, file = "../result/result_data/chemical_entity.txt", quote = F, sep = "\n", row.names = F, col.names = F) # chemical实体数据输出
