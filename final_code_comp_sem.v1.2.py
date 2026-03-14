# in R you will want to open and read all of the files you saved for each city as different variables.

#then you will want to merge all of the files for each city together so you should have 3 master csv files in 1 folder

#then it's possible to do the distributional analysis in Python. 

#Once we have the 3 master csv files for ABQ, LA, and SA then we can run the following code to do our distributional analysis

#step 1 : import the following packages:

import os
import nltk
import import math
import pandas as pd
import string
import numpy
import scipy

#for the nltk stopwords:
from nltk.corpus import stopwords
stop_words = stopwords.words('spanish')

#this list I apply to get rid of some of the noise to clean up the data
letters= ['', 'r', 's', 't', 'l', 'i', 'n', 'm', 'c', 'u', 'd', 'p', 'ã', 'h', 'g', 'b', 'í', 'v', 'j', 'x', 'q', 'f', 'z', 'e', 'a', 'â', '\x93', 'o', 'w', '¡', '³', '½', '\x80', 'y', '¦', '\xad', '¸']

#this creates the path to the folder where I have my 3 master csv files for the data (yours will be different)
data_dir="/Users/SanchoPanza/Documents/collect_orale/preprocess_r/"

#preprocessing function to remove unwanted data and stopwords
def preprocess(tweet):
    words=[]
    for word in tweet.split():
#        if word == "Ã\x93rale" or word =="Ã³rale" or "ã³rale":
#            word.replace(word, "orale")
        #if not word.startswith("RT") and not word.startswith("@") and not word.startswith("http") and word not in stop_words and word not in letters:
#            words.append((word.strip(string.punctuation)).lower())
        if word not in stop_words:
            words.append(word)
    return words


#this function does the word counting, but also maps any weird encoding orale's to a single 1, and also will create out orale1, orale2, and orale3 as it cycles through
def do_word_count(data_dir, numdims):
    word_count=nltk.FreqDist()
    counter=0
    for filename in os.listdir(data_dir):
        counter=counter+1
        tweets= pd.read_csv(os.path.join(data_dir, filename), header='infer', encoding="latin-1")
        tweets_file= (tweets["text"]).values
        for tweet in tweets_file:
            tweet = str(tweet).replace("orale", "orale" + str(counter))
 #           tweet = tweet.replace("Orale", "orale" + str(counter))
#            tweet = tweet.replace("Ã\x93rale", "orale" + str(counter))
#            tweet = tweet.replace("Ã³rale", "orale"+ str(counter))
#            tweet = tweet.replace("ã³rale", "orale"+ str(counter))
#            tweet = tweet.replace("ã\x93rale", "orale"+ str(counter))
#            tweet = tweet.replace("â¡orale", "orale"+ str(counter))
#            tweet= tweet.replace("Â¡orale", "orale"+ str(counter))
#            tweet = tweet.replace("â¡orale", "orale"+ str(counter))
            word_count.update(preprocess(tweet))
    #for tweet in tweets.values:
    #    word_count.update(preprocess(tweet))
    keep_wordfreq = word_count.most_common(numdims)
    keep_these_words = [w for w, freq in keep_wordfreq]
    return keep_these_words

#this function does the cooccurances for up to 15 words around our "orale" term. we might be missing out on some words, but this more or less seemed to be the max length of words of a tweet

def co_occurrences(wordsequence):
    target_context_pairs = [ ]

    # for a sequence of length N, count from 0 to N-1
    for index in range(len(wordsequence) - 1):
        # count that word[index] as a target co-occurred with the next word as a context item,
        # and vice versa
        target_context_pairs.append( (wordsequence[index], wordsequence[index+1]) )
        target_context_pairs.append( (wordsequence[index+1], wordsequence[index]) )

        if index + 2 < len(wordsequence):
            # there is a word 2 words away
            # count that word[index] as a target co-occurred with the but-next word as a context item,
            # and vice versa
            target_context_pairs.append( (wordsequence[index], wordsequence[index+2]) )
            target_context_pairs.append( (wordsequence[index+2], wordsequence[index]) )

        if index + 3 < len(wordsequence):
            target_context_pairs.append( (wordsequence[index], wordsequence[index+3]) )
            target_context_pairs.append( (wordsequence[index+3], wordsequence[index]) )

        if index + 4 < len(wordsequence):
            target_context_pairs.append( (wordsequence[index], wordsequence[index+4]) )
            target_context_pairs.append( (wordsequence[index+4], wordsequence[index]) )

        if index + 5 < len(wordsequence):
            target_context_pairs.append( (wordsequence[index], wordsequence[index+5]) )
            target_context_pairs.append( (wordsequence[index+5], wordsequence[index]) )

        if index + 6 < len(wordsequence):
            target_context_pairs.append( (wordsequence[index], wordsequence[index+6]) )
            target_context_pairs.append( (wordsequence[index+6], wordsequence[index]) )

        if index + 7 < len(wordsequence):
            target_context_pairs.append( (wordsequence[index], wordsequence[index+7]) )
            target_context_pairs.append( (wordsequence[index+7], wordsequence[index]) )
        
        if index + 8 < len(wordsequence):
            target_context_pairs.append( (wordsequence[index], wordsequence[index+8]) )
            target_context_pairs.append( (wordsequence[index+8], wordsequence[index]) )

        if index + 9 < len(wordsequence):
            target_context_pairs.append( (wordsequence[index], wordsequence[index+9]) )
            target_context_pairs.append( (wordsequence[index+9], wordsequence[index]) )

        if index + 10 < len(wordsequence):
            target_context_pairs.append( (wordsequence[index], wordsequence[index+10]) )
            target_context_pairs.append( (wordsequence[index+10], wordsequence[index]) )

        if index + 11 < len(wordsequence):
            target_context_pairs.append( (wordsequence[index], wordsequence[index+11]) )
            target_context_pairs.append( (wordsequence[index+11], wordsequence[index]) )

        if index + 12 < len(wordsequence):
            target_context_pairs.append( (wordsequence[index], wordsequence[index+12]) )
            target_context_pairs.append( (wordsequence[index+12], wordsequence[index]) )

        if index + 13 < len(wordsequence):
            target_context_pairs.append( (wordsequence[index], wordsequence[index+13]) )
            target_context_pairs.append( (wordsequence[index+13], wordsequence[index]) )

        if index + 14 < len(wordsequence):
            target_context_pairs.append( (wordsequence[index], wordsequence[index+14]) )
            target_context_pairs.append( (wordsequence[index+14], wordsequence[index]) )

        if index + 15 < len(wordsequence):
            target_context_pairs.append( (wordsequence[index], wordsequence[index+15]) )
            target_context_pairs.append( (wordsequence[index+15], wordsequence[index]) )


    return target_context_pairs

def make_word_index(keep_these_words):
    # make an index that maps words from 'keep_these_words' to their index
    word_index = { }
    for index, word in enumerate(keep_these_words):
        word_index[ word ] = index

    return word_index

##### making the vector space from our data
def make_space(data_dir, word_index, numdims):
    relevant_words = set(word_index.keys())
    space = { }
    for word in relevant_words:
        space[ word ] = numpy.zeros(numdims, dtype = numpy.int)
    
    counter=0
    for filename in os.listdir(data_dir):
        counter=counter+1
        tweets= pd.read_csv(os.path.join(data_dir, filename), header='infer', encoding="latin-1")
        tweets_file= (tweets["text"]).values
        for tweet in tweets_file:
            tweet = str(tweet).replace("orale", "orale" + str(counter))
 #           tweet = tweet.replace("Orale", "orale" + str(counter))
#            tweet = tweet.replace("Ã\x93rale", "orale" + str(counter))
#            tweet = tweet.replace("Ã³rale", "orale"+ str(counter))
#            tweet = tweet.replace("ã³rale", "orale"+ str(counter))
#            tweet = tweet.replace("ã\x93rale", "orale"+ str(counter))
#            tweet = tweet.replace("â¡orale", "orale"+ str(counter))
#            tweet= tweet.replace("Â¡orale", "orale"+ str(counter))
#            tweet = tweet.replace("â¡orale", "orale"+ str(counter))
            words = preprocess(tweet)
            for target, cxitem in co_occurrences(words):
                if target in relevant_words and cxitem in relevant_words:
                    cxitem_index = word_index[ cxitem]
                        
                    space[ target ][cxitem_index] += 1
    return space

#this is transforming and normalizing our numbers from our vector space

def ppmi_transform(space, word_index):
    # #(t, _): for each target word, sum up all its counts.
    # row_sums is a dictionary mapping from target words to row sums
    row_sums = { }
    for word in space.keys():
        row_sums[word] = space[word].sum()

    # #(_, c): for each context word, sum up all its counts
    # This should be the same as #(t, _) because the set of targets
    # is the same as the set of contexts.
    # col_sums is a dictionary mapping from context word indices to column sums
    col_sums = { }
    for index in word_index.values():
        col_sums[ index ] = sum( [ vector[ index ] for vector in space.values() ])

    # sanity check: row sums same as column sums?
    for word in space.keys():
        if row_sums[word] != col_sums[ word_index[word]]:
            print("whoops, failed sanity check for", word, row_sums[word], col_sums[word_index[word]])
   
    # #(_, _): overall count of occurrences. sum of all row_sums
    all_sums = sum(row_sums.values())

    # if all_sums is zero, there's nothing we can do
    # because we then cannot divide by #(_, _)
    if all_sums == 0:
        print("completely empty space, returning it unchanged")
        return space

    # P(t) = #(t, _) / #(_, _)
    p_t = { }
    for word in space.keys():
        p_t[ word ] = row_sums[ word ] / all_sums

    # P(c) = #(_, c) / #(_, _)
    p_c = { }
    for index in col_sums.keys():
        p_c[ index ] = col_sums[ index ] / all_sums

    # ppmi_space: a mapping from words to vectors of values
    ppmi_space = { }
    # first we map from words to values P(t, c)
    for word in space.keys():
        ppmi_space[ word ] = space[ word ] / all_sums
    # divide each entry by P(t)
    for word in space.keys():
        if p_t[ word ] == 0:
            # I haven't seen this word ever, so I cannot
            # divide by P(t). But the whole entry for this word
            # should be 0's, so leave as is.
            pass
        else:
            ppmi_space[ word ] = ppmi_space[ word ] / p_t[ word ]
    # divide each entry by P(c)
    for index in p_c.keys():
        if p_c[ index ] == 0:
            # I haven't seen this context item ever,
            # so I cannot divide by P(c).
            # But every target word will have an entry of 0.0
            # on this column, so nothing more to do.
            pass
        else:
            for word in space.keys():
                ppmi_space[ word ][index] = ppmi_space[ word][index] / p_c[ index ]
               
    # take the logarithm, ignore entries that are zero
    for word in space.keys():
        with numpy.errstate(divide="ignore",invalid="ignore"):
            ppmi_space[ word ] = numpy.log(ppmi_space[ word ])
           

    # turn negative numbers to zero
    for word in space.keys():
        ppmi_space[word] = numpy.maximum(ppmi_space[word], 0.0)

    return ppmi_space


#reducing dimensions of our vector space

def svd_transform(space, originalnumdimensions,keepnumdimensions):
    # space is a dictionary mapping words to vectors.
    # combine those into a big matrix.
    spacematrix = numpy.empty((len(space.keys()), originalnumdimensions))

    rowlabels = sorted(space.keys())

    for index, word in enumerate(rowlabels):
        spacematrix[index] = space[word]

    # now do SVD
    umatrix, sigmavector, vmatrix = numpy.linalg.svd(spacematrix)

    # remove the last few dimensions of u and sigma
    utrunc = umatrix[:, :keepnumdimensions]
    sigmatrunc = sigmavector[ :keepnumdimensions]

    # new space: U %matrixproduct% Sigma_as_diagonal_matrix  
    newspacematrix = numpy.dot(utrunc, numpy.diag(sigmatrunc))

    # transform back to a dictionary mapping words to vectors
    newspace = { }
    for index, word in enumerate(rowlabels):
        newspace[ word ] = newspacematrix[index]
       
    return newspace


#computing similarity

def veclen(vector):
    return math.sqrt(numpy.sum(numpy.square(vector)))

def cosine(word1, word2, space):
    vec1 = space[ word1 ]
    vec2 = space[word2]

    veclen1 = veclen(vec1)
    veclen2 = veclen(vec2)

    if veclen1 == 0.0 or veclen2 == 0.0:
        # one of the vectors is empty. make the cosine zero.
        return 0.0

    else:
        # we could also simply do:
        # dotproduct = numpy.dot(vec1, vec2)
        dotproduct = numpy.sum(vec1 * vec2)

        return dotproduct / (veclen1 * veclen2)


#so this should all run without error:    
ktw= do_word_count(data_dir, 1000)
wi= make_word_index(ktw)
words_in_order = sorted(wi.keys(), key=lambda w:wi[w])
space= make_space(data_dir, wi, 10000)
ppmispace = ppmi_transform(space, wi)
svdspace = svd_transform(ppmispace, 1000, 300)

#then I tried typing in the functions to get cosines and vector from our data:

cosine("orale1", "orale2", svdspace)

cosine("orale1", "orale3", svdspace)

cosine("orale2", "orale3", svdspace)


#this to find the most similar:
def most_similar_to(word1, space):

    sims = [ (word2, cosine(word1, word2, space)) for word2 in space.keys() if word2 != word1 ]

    return (sorted(sims, key = lambda p:p[1], reverse=True))[20]

most_similar_to("orale1", svdspace)

most_similar_to("orale1", ppmispace)
