---
title: "Spidey Sentiment"
author: "Samuel Louissaint"
date: '2021-12-27'
slug: spidey-sentiment
categories: []
tags: []
subtitle: ''
summary: ''
authors: []
lastmod: '2021-12-27T12:47:13-04:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

Releasing in theaters on December 17th, 2021, Spider-Man: No Way Home has surpassed box office expectations and achieved opening weekend numbers that rival pre-pandemic figures. That being said, I still haven’t found my way to a movie theater to watch it myself. In lieu of this, I decided to do the next best thing and analyze some of the latest tweets mentioning the movie title.

I used the rtweet package to extract the latest 25000 original tweets, which at the time ranged from Dec 21 to Dec 27, from Twitter’s REST and streaming APIs. After tokenizing the text and cleaning the dataset of filler words, I first visualized the volume of tweets made about the film by the hour.
	
![Tweet Volume](/media/spidey_sentiment/viz1.png)

In the plot, you can see that tweets declined slowly with each passing day, though peak times for tweeting seem to appear consistently across the days. There’s also a very noticeable lack of tweets on December 25th relative to the other days, an occurrence that is undoubtedly related to the Christmas holiday.

Beyond the quantity of tweets, I also wanted to get an image of how people felt about the film... without spoiling it for myself, of course. I accomplished this by grouping words within categories of the NRC Emotion Lexicon, obtaining a tally for each category, and visualizing this in the pie chart below.

![Pie Chart](/media/spidey_sentiment/viz2.png)

The pie chart demonstrates a balanced demonstration of emotional lexicon and more positive than negative tweets recorded. While I’m pleased to see that audiences seemed to have a wide distribution of emotional responses, I’m unsure what this means for the mental toll the movie’s plot may bring me.

To delve a bit deeper, I also visualized the affinity score over time for tweets mentioning the movie’s title, where affinity is a measure with a mean of 0 and positive values indicate positive sentiments expressed about the movie. In the plot, we see that the affinity score for the movie remains steadily above 1, with one dip serving as an exception.

![Sentiment Plot](/media/spidey_sentiment/viz3.png)

![Word Cloud](/media/spidey_sentiment/viz4.png)

Lastly, I added a WordCloud plot to get a glimpse at words that are currently associated with the movie. Other than the lack of negative terms, there isn’t much insight to be gained from the word cloud. Instead, it vaguely resembles an unintended advertisement for Marvel’s relatively newer media projects.



