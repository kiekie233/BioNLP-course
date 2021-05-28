esearch -db pubmed -query "covid-19" | efetch -format uid > ../preparing_data/covid_19_uid.txt # 获取uid

echo 'I am curating the result.\n'
echo "\n" > covid_19_entity_result.txt
for pmid in `cat ../preparing_data/covid_19_uid.txt`
do
    curl "https://www.ncbi.nlm.nih.gov/research/pubtator-api/publications/export/pubtator?pmids=${pmid}" >> ../preparing_data/covid_19_entity_result.txt
    sleep 5.8s
done # 通过PubTator API获取实体数据

grep -E "^[0-9]{8}\s" covid_19_entity_result.txt > ../preparing_data/covid_19_entity_result_entity.txt # 提取实体数据
grep -E "^[0-9]{8}\|a" covid_19_entity_result.txt | sed -r "s/.{11}//" > ../preparing_data/covid_19_entity_result_abstract.txt # 提取摘要数据
