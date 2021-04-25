---
title: Spotify Hits
author: Samuel Louissaint
date: '2021-04-20'
slug: spotify-hits
categories: []
tags: []
subtitle: ''
summary: ''
authors: []
lastmod: '2021-04-20T12:47:13-04:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

It doen't take an avid music listener to notice that many popular songs have the same formula to them. Radio stations can often sound like the same song is playing on repeat, with slightly different variants of the same song gaining recognition and winning awards.

This very thought led me to find a Spotify dataset that contained all Billboard top 10 songs from the years 2010 to 2019. All there was left to do was explore it a bit.


I started by doing some exploratory analysis of the dataset.
While the categorical variables are self-explanatory, here's a key for the quantitative variables for reference:

    - acousticness (Ranges from 0 to 1)
    - danceability (Ranges from 0 to 1)
    - energy (Ranges from 0 to 1)
    - duration_ms (Integer typically ranging from 200k to 300k)
    - instrumentalness (Ranges from 0 to 1)
    - valence (Ranges from 0 to 1)
    - popularity (Ranges from 0 to 100)
    - tempo (Float typically ranging from 50 to 150)
    - liveness (Ranges from 0 to 1)
    - loudness (Float typically ranging from -60 to 0)
    - speechiness (Ranges from 0 to 1)


```r
summary(top10s)
```

```
##        X            title              artist           top.genre        
##  Min.   :  1.0   Length:603         Length:603         Length:603        
##  1st Qu.:151.5   Class :character   Class :character   Class :character  
##  Median :302.0   Mode  :character   Mode  :character   Mode  :character  
##  Mean   :302.0                                                           
##  3rd Qu.:452.5                                                           
##  Max.   :603.0                                                           
##       year           bpm             nrgy           dnce      
##  Min.   :2010   Min.   :  0.0   Min.   : 0.0   Min.   : 0.00  
##  1st Qu.:2013   1st Qu.:100.0   1st Qu.:61.0   1st Qu.:57.00  
##  Median :2015   Median :120.0   Median :74.0   Median :66.00  
##  Mean   :2015   Mean   :118.5   Mean   :70.5   Mean   :64.38  
##  3rd Qu.:2017   3rd Qu.:129.0   3rd Qu.:82.0   3rd Qu.:73.00  
##  Max.   :2019   Max.   :206.0   Max.   :98.0   Max.   :97.00  
##        dB               live            val             dur       
##  Min.   :-60.000   Min.   : 0.00   Min.   : 0.00   Min.   :134.0  
##  1st Qu.: -6.000   1st Qu.: 9.00   1st Qu.:35.00   1st Qu.:202.0  
##  Median : -5.000   Median :12.00   Median :52.00   Median :221.0  
##  Mean   : -5.579   Mean   :17.77   Mean   :52.23   Mean   :224.7  
##  3rd Qu.: -4.000   3rd Qu.:24.00   3rd Qu.:69.00   3rd Qu.:239.5  
##  Max.   : -2.000   Max.   :74.00   Max.   :98.00   Max.   :424.0  
##      acous            spch             pop       
##  Min.   : 0.00   Min.   : 0.000   Min.   : 0.00  
##  1st Qu.: 2.00   1st Qu.: 4.000   1st Qu.:60.00  
##  Median : 6.00   Median : 5.000   Median :69.00  
##  Mean   :14.33   Mean   : 8.358   Mean   :66.52  
##  3rd Qu.:17.00   3rd Qu.: 9.000   3rd Qu.:76.00  
##  Max.   :99.00   Max.   :48.000   Max.   :99.00
```

Songs that generally have the same sound could be explained by a number of reasons, such as coming from the same genre or artist. With that in mind, I wanted to explore the relationship between top songs and the artist making them a little more.
<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-3-1.png" width="672" />

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#cziqurrlqn .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#cziqurrlqn .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#cziqurrlqn .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#cziqurrlqn .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#cziqurrlqn .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cziqurrlqn .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#cziqurrlqn .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#cziqurrlqn .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#cziqurrlqn .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#cziqurrlqn .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#cziqurrlqn .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#cziqurrlqn .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#cziqurrlqn .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#cziqurrlqn .gt_from_md > :first-child {
  margin-top: 0;
}

#cziqurrlqn .gt_from_md > :last-child {
  margin-bottom: 0;
}

#cziqurrlqn .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#cziqurrlqn .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#cziqurrlqn .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#cziqurrlqn .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#cziqurrlqn .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#cziqurrlqn .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#cziqurrlqn .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#cziqurrlqn .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#cziqurrlqn .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#cziqurrlqn .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#cziqurrlqn .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#cziqurrlqn .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#cziqurrlqn .gt_left {
  text-align: left;
}

#cziqurrlqn .gt_center {
  text-align: center;
}

#cziqurrlqn .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#cziqurrlqn .gt_font_normal {
  font-weight: normal;
}

#cziqurrlqn .gt_font_bold {
  font-weight: bold;
}

#cziqurrlqn .gt_font_italic {
  font-style: italic;
}

#cziqurrlqn .gt_super {
  font-size: 65%;
}

#cziqurrlqn .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>
<div id="cziqurrlqn" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;"><table class="gt_table">
  <thead class="gt_header">
    <tr>
      <th colspan="3" class="gt_heading gt_title gt_font_normal" style># of Genres for Artists with Multiple Hits</th>
    </tr>
    <tr>
      <th colspan="3" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>For each artitst with multiple hits in a year, in  how many genres were their  hits?</th>
    </tr>
  </thead>
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">Year</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1"># of Genres</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1"># of Artists</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr>
      <td class="gt_row gt_center">2010</td>
      <td class="gt_row gt_center">1</td>
      <td class="gt_row gt_center">12</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2011</td>
      <td class="gt_row gt_center">1</td>
      <td class="gt_row gt_center">12</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2012</td>
      <td class="gt_row gt_center">1</td>
      <td class="gt_row gt_center">9</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2013</td>
      <td class="gt_row gt_center">1</td>
      <td class="gt_row gt_center">16</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2014</td>
      <td class="gt_row gt_center">1</td>
      <td class="gt_row gt_center">7</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2015</td>
      <td class="gt_row gt_center">1</td>
      <td class="gt_row gt_center">20</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2016</td>
      <td class="gt_row gt_center">1</td>
      <td class="gt_row gt_center">18</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2017</td>
      <td class="gt_row gt_center">1</td>
      <td class="gt_row gt_center">15</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2018</td>
      <td class="gt_row gt_center">1</td>
      <td class="gt_row gt_center">13</td>
    </tr>
    <tr>
      <td class="gt_row gt_center">2019</td>
      <td class="gt_row gt_center">1</td>
      <td class="gt_row gt_center">6</td>
    </tr>
  </tbody>
  
  
</table></div>
This brief investigation tells us the top artists over the 10-year period as well as the fact that their respective hits were all within the same genre. This lets us know that artists are hesitant to change the formulas that bring them success. Or that listeners aren't interested in the songs that do change that formula. 


I then started wondering about one-hit wonders and the effect that the addition of new streaming platforms had on the variety of artists that created hits.
<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-5-1.png" width="672" />
It's hard to find a trend in the first half of the decade. However, after the spike in 2015, there's a marked decrease in the number of artists that were able to produce multiple hit songs within a year. Rather than attributing this trend solely to streaming platforms, it may also be a byproduct of increasing ways to produce music.

Me, Myself, and I by G Eazy was unmistakably one of the biggest hits on the radio when it was released. Though what I found most interesting was the number of songs that went by the same title though created by different artists (Big Sean and Beyonce to name a couple) in different genres. This led me to investigate whether the subject of a song, expressed by its title, had an effect on whether it would be a hit.

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-6-1.png" width="672" />

I do realize there is a level of overlap, such as the possibility that a song has multiple subjects and even a verb, allowing a song titled "I Love You" to be cross-listed 3 times. Despite this, "Love" had particularly interesting results in my opinion. Being the only word that is both a noun and a verb, I expected it to appear more often than all except for "You" which was understandably common.

Finally, I'm sure you've noticed the variable "pop" is intuitively related to the likelihood that a song would be in the Billboards Top 10. So I ventured to identify the relationship between the other quantitative variables and a song being a Billboards Number 1. For this, I created a dummy variable that represented whether a song was ever a Billboards Number 1. 


After doing so, I created a basic model to identify the relationship.

```
## 
## Call:
## glm(formula = No.1 ~ bpm + nrgy + dnce + dB + live + val + dur + 
##     acous + spch, family = "binomial", data = no1s)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -1.0643  -0.5577  -0.4415  -0.3481   2.3584  
## 
## Coefficients:
##              Estimate Std. Error z value Pr(>|z|)  
## (Intercept) -4.208190   1.969787  -2.136   0.0326 *
## bpm          0.006368   0.005423   1.174   0.2403  
## nrgy        -0.022631   0.012427  -1.821   0.0686 .
## dnce         0.028082   0.011820   2.376   0.0175 *
## dB           0.150532   0.099779   1.509   0.1314  
## live        -0.013261   0.011021  -1.203   0.2289  
## val          0.010855   0.007222   1.503   0.1328  
## dur          0.005659   0.003756   1.507   0.1319  
## acous        0.007156   0.007164   0.999   0.3179  
## spch         0.033400   0.015182   2.200   0.0278 *
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 456.81  on 602  degrees of freedom
## Residual deviance: 430.65  on 593  degrees of freedom
## AIC: 450.65
## 
## Number of Fisher Scoring iterations: 5
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-8-1.png" width="672" /><img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-8-2.png" width="672" /><img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-8-3.png" width="672" /><img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-8-4.png" width="672" />

Here we very clearly see that the specifications of the songs aren't the the largest driving factor in the success of a song, as only danceability and speechiness were shown to be statistically significant. The same outcome held even with numerous transformations to the model.

It seems that the unaccounted for variables (artist, genre, etc.) do much of the heavy lifting for a song's success. And honestly no surprise there. This would explain both why songs sound similar, and why those artists don't (and do) feel comfortable changing their styles.
