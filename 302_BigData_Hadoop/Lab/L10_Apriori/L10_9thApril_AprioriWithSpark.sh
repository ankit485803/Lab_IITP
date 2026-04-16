
:'

9th April 2026 (Thursday) researchPaperTile: YAFIM: A Parallel Frequent Itemset Mining Algorithm with Spark

Lab 10 on the Apriori algo using spark and YAFIM

YAFIM (Yet Another Frequent Itemset Mining algorithm)


Topic: Implementation of Apriori Algorithm using Apache Spark and YAFIM

Objective
To implement and analyze frequent itemset mining using the Apriori algorithm with:

Apache Spark (MLlib / DataFrame approach)
YAFIM (Yet Another Frequent Itemset Mining algorithm)


Theory
Apriori Algorithm is a classic algorithm used in data mining for:

Finding frequent itemsets
Generating association rules

It works on the principle:
“If an itemset is frequent, all of its subsets must also be frequent.”





2. Using YAFIM

YAFIM (Yet Another Frequent Itemset Mining):

Designed for distributed environments
Efficient for large-scale datasets
Works similarly to Apriori but optimized for parallel processing

Steps:

Prepare dataset in transactional format
Set minimum support threshold
Run YAFIM algorithm
Extract frequent itemsets



'