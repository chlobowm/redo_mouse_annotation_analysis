#make gtf final into variable 
gtf=Mus_musculus.GRCm38.75_chr1.gtf 

#count the number of annotated genes
grep -v "^#" $gtf | awk -F"\t" '$3=="gene"' | wc -l

#breaks down genes by biotype, count the number of annotated genes in each group, and then sort in decending order
grep -v "^#" $gtf | awk -F"\t" '$3=="gene"' | sed 's/.*gene_biotype "\([^"]*\)".*/\1/' | sort | uniq -c | sort -nr
