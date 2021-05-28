#PBS -N get_covid_19_entity
#PBS -l nodes=1:ppn=5
#PBS -l walltime=7200:00:00
#PBS -l mem=5G
#PBS -q batch
#PBS -V
#cd $PBS_O_WORKDIR

echo 'I am curating the result.\n'
echo "\n" > covid_19_entity_result.txt

for pmid in `cat ~/NLP/task3/covid_19_uid.txt`
do
    curl "https://www.ncbi.nlm.nih.gov/research/pubtator-api/publications/export/pubtator?pmids=${pmid}" >> ~/NLP/task3/covid_19_entity_result.txt
done
