# Regional variation in US-border Spanish: ¡Órale!
# A study in Computational Semantics

## Abstract
The word órale, in the Mexican and border varieties of Spanish can take on many meanings. Primarily a colloquial term, it is only ever really used in spontaneous informal speech, which makes it difficult to study as even in sociolinguistic interviews participants tend to monitor their speaking. Órale can be an enthusiastic greeting among friends in New Mexico, speaking English, can be an urge for something to hurry up, encouragement of some action, an agreement to something, among other meanings. While this term and others like it have previously been difficult to study due to low frequency in written texts or in traditional oral sociolinguistic interviews, the advent and popularity of social media have created a vast amount of data that contains lexical choices and discourse markers usually seen only in oral speech.
Utilizing Twitter as a resource, we gathered tweets containing órale to investigate regional differences in usage by comparing vector space distributional models across several US cities and Mexico City, examining whether English contact coincides with any differences in usage.

## Methods 
R was used to connect to the Twitter API and collect the geographically delimited tweets with "órale" and Python was utilized to perform the semantic analysis.

- City comparison: San Antonio, Los Angeles, Albuquerque
- Dataset: 212,966 tweets
- Cosine similarity
- Corpus analysis

## Results
The distributional analysis of Twitter data suggests regional differences in usage of órale across cities:

- Albuquerque & Los Angeles: cosine similarity = 0.97 — very similar usage contexts 
- Los Angeles & San Antonio: cosine similarity = 0.86 
- Albuquerque & San Antonio: cosine similarity = 0.86 

Results suggest a separation of usage variant in Texas, while Albuquerque and Los Angeles show remarkably similar usage patternn, which potentially reflects both dialectal similarities and connected online Twitter communities across geographic boundaries. See Spanish_Cosine.png for the visualization

Future research could include El Paso and Rio Grande Valley data to further investigate regional variation within Texas.

## Tools
- Python
- R

## Data
Raw Twitter data not included due to Twitter API 
Terms of Service. Scripts reproducible with 
appropriate API access.
