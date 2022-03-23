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

It doesn’t take an avid music listener to notice that many popular songs have the same formula to them. Radio stations can often sound like the same song is playing on repeat, with slightly different variants of the same song gaining recognition and winning awards.

This very thought led me to find a Spotify dataset that contained all Billboard top 10 songs from the years 2010 to 2019. All there was left to do was explore it a bit.

I started by doing some exploratory analysis of the dataset.
While the categorical variables are self-explanatory, here’s a key for the quantitative variables for reference:

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

``` r
summary(topten)
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

Songs that generally have the same sound could be explained by a number of reasons, such as coming from the same genre or artist. With that in mind, I wanted to explore the relationship between top songs and the artist making them.
<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-3-1.png" width="672" />

<div id="ypatfctnhu" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#ypatfctnhu .gt_table {
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

#ypatfctnhu .gt_heading {
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

#ypatfctnhu .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#ypatfctnhu .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#ypatfctnhu .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ypatfctnhu .gt_col_headings {
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

#ypatfctnhu .gt_col_heading {
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

#ypatfctnhu .gt_column_spanner_outer {
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

#ypatfctnhu .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#ypatfctnhu .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#ypatfctnhu .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#ypatfctnhu .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
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

#ypatfctnhu .gt_empty_group_heading {
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

#ypatfctnhu .gt_from_md > :first-child {
  margin-top: 0;
}

#ypatfctnhu .gt_from_md > :last-child {
  margin-bottom: 0;
}

#ypatfctnhu .gt_row {
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

#ypatfctnhu .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#ypatfctnhu .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#ypatfctnhu .gt_row_group_first td {
  border-top-width: 2px;
}

#ypatfctnhu .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ypatfctnhu .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#ypatfctnhu .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#ypatfctnhu .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ypatfctnhu .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#ypatfctnhu .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#ypatfctnhu .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#ypatfctnhu .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#ypatfctnhu .gt_footnotes {
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

#ypatfctnhu .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-left: 4px;
  padding-right: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#ypatfctnhu .gt_sourcenotes {
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

#ypatfctnhu .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#ypatfctnhu .gt_left {
  text-align: left;
}

#ypatfctnhu .gt_center {
  text-align: center;
}

#ypatfctnhu .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#ypatfctnhu .gt_font_normal {
  font-weight: normal;
}

#ypatfctnhu .gt_font_bold {
  font-weight: bold;
}

#ypatfctnhu .gt_font_italic {
  font-style: italic;
}

#ypatfctnhu .gt_super {
  font-size: 65%;
}

#ypatfctnhu .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 75%;
  vertical-align: 0.4em;
}

#ypatfctnhu .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#ypatfctnhu .gt_slash_mark {
  font-size: 0.7em;
  line-height: 0.7em;
  vertical-align: 0.15em;
}

#ypatfctnhu .gt_fraction_numerator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: 0.45em;
}

#ypatfctnhu .gt_fraction_denominator {
  font-size: 0.6em;
  line-height: 0.6em;
  vertical-align: -0.05em;
}
</style>
<table class="gt_table">
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
    <tr><td class="gt_row gt_center">2010</td>
<td class="gt_row gt_center">1</td>
<td class="gt_row gt_center">12</td></tr>
    <tr><td class="gt_row gt_center">2011</td>
<td class="gt_row gt_center">1</td>
<td class="gt_row gt_center">12</td></tr>
    <tr><td class="gt_row gt_center">2012</td>
<td class="gt_row gt_center">1</td>
<td class="gt_row gt_center">9</td></tr>
    <tr><td class="gt_row gt_center">2013</td>
<td class="gt_row gt_center">1</td>
<td class="gt_row gt_center">16</td></tr>
    <tr><td class="gt_row gt_center">2014</td>
<td class="gt_row gt_center">1</td>
<td class="gt_row gt_center">7</td></tr>
    <tr><td class="gt_row gt_center">2015</td>
<td class="gt_row gt_center">1</td>
<td class="gt_row gt_center">20</td></tr>
    <tr><td class="gt_row gt_center">2016</td>
<td class="gt_row gt_center">1</td>
<td class="gt_row gt_center">18</td></tr>
    <tr><td class="gt_row gt_center">2017</td>
<td class="gt_row gt_center">1</td>
<td class="gt_row gt_center">15</td></tr>
    <tr><td class="gt_row gt_center">2018</td>
<td class="gt_row gt_center">1</td>
<td class="gt_row gt_center">13</td></tr>
    <tr><td class="gt_row gt_center">2019</td>
<td class="gt_row gt_center">1</td>
<td class="gt_row gt_center">6</td></tr>
  </tbody>
  
  
</table>
</div>

This brief investigation tells us the top artists over the 10-year period as well as the fact that their respective hits were all within the same genre. This implies that artists are hesitant to change the formulas that bring them success. Or that listeners aren’t interested in the songs that do change that formula.

I then started wondering about one-hit wonders and the effect that the addition of new streaming platforms had on the variety of artists that created hits.
<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-5-1.png" width="672" />
It’s hard to find a trend in the first half of the decade. However, after the spike in 2015, there’s a marked decrease in the number of artists that were able to produce multiple hit songs within a year. Rather than attributing this trend solely to streaming platforms, it may also be a byproduct of increasing ways to produce music.

Me, Myself, and I by G-Eazy was unmistakably one of the biggest hits on the radio when it was released. Though what I found most interesting was the number of songs that went by the same title though created by different artists (Big Sean and Beyonce to name a couple) in different genres. This led me to investigate whether the subject of a song, expressed by its title, had an effect on whether it would be a hit.

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-6-1.png" width="672" />

I did realize there is a level of overlap, such as the possibility that a song title has multiple subjects and even a verb, allowing a song titled “I Love You” to be cross-listed 3 times. Despite this, “Love” had particularly interesting results in my opinion. Being the only word that is both a noun and a verb, I expected it to appear more often than all except for “You” which was understandably common.

Finally, I’m sure you’ve noticed the variable “pop” is intuitively related to the likelihood that a song would be in the Billboards Top 10. So I ventured to identify the relationship between the other quantitative variables and a song being a Billboards Number 1. For this, I created a dummy variable that represented whether a song was ever a Billboards Number 1.

Unfortunately the target data is very unbalanced, with only 72 of 603 observations having been a billboards number 1. In an attempt to build a substantive model, I tried both oversampling and undersampling. But before that, I created a model using random forest with the unbalanced data to demonstrate the issue.

    ## Confusion Matrix and Statistics
    ## 
    ##           Reference
    ## Prediction  no yes
    ##        no  105  13
    ##        yes   0   2
    ##                                          
    ##                Accuracy : 0.8917         
    ##                  95% CI : (0.8219, 0.941)
    ##     No Information Rate : 0.875          
    ##     P-Value [Acc > NIR] : 0.3502795      
    ##                                          
    ##                   Kappa : 0.2121         
    ##                                          
    ##  Mcnemar's Test P-Value : 0.0008741      
    ##                                          
    ##             Sensitivity : 1.0000         
    ##             Specificity : 0.1333         
    ##          Pos Pred Value : 0.8898         
    ##          Neg Pred Value : 1.0000         
    ##              Prevalence : 0.8750         
    ##          Detection Rate : 0.8750         
    ##    Detection Prevalence : 0.9833         
    ##       Balanced Accuracy : 0.5667         
    ##                                          
    ##        'Positive' Class : no             
    ## 

Based on the “No Information Rate” it’s clear that there’s such a strong majority in the target feature, the model simply predicts that practically no songs are Billboards number 1s. This leads to a good accuracy score but awful kappa and specificity scores.

Think of the kappa value as being indicative of how much of the prediction would be accurate even if all predictions were allocated to the majority class, 1 indicating it’s a useful model despite unbalanced data and 0 meaning it isn’t helpful.

To address this, first I tried undersampling and arrived at the following output.

    ## Confusion Matrix and Statistics
    ## 
    ##           Reference
    ## Prediction no yes
    ##        no  50   8
    ##        yes 55   7
    ##                                           
    ##                Accuracy : 0.475           
    ##                  95% CI : (0.3831, 0.5682)
    ##     No Information Rate : 0.875           
    ##     P-Value [Acc > NIR] : 1               
    ##                                           
    ##                   Kappa : -0.0244         
    ##                                           
    ##  Mcnemar's Test P-Value : 6.814e-09       
    ##                                           
    ##             Sensitivity : 0.4762          
    ##             Specificity : 0.4667          
    ##          Pos Pred Value : 0.8621          
    ##          Neg Pred Value : 0.1129          
    ##              Prevalence : 0.8750          
    ##          Detection Rate : 0.4167          
    ##    Detection Prevalence : 0.4833          
    ##       Balanced Accuracy : 0.4714          
    ##                                           
    ##        'Positive' Class : no              
    ## 

While the undersampled model had a more even distribution of predictions for each class, this resulted in a test accuracy score that’s worse than a theoretical coin flip.  
The random forest model with oversampling resulted in the following output.

    ## Confusion Matrix and Statistics
    ## 
    ##           Reference
    ## Prediction  no yes
    ##        no  105  13
    ##        yes   0   2
    ##                                          
    ##                Accuracy : 0.8917         
    ##                  95% CI : (0.8219, 0.941)
    ##     No Information Rate : 0.875          
    ##     P-Value [Acc > NIR] : 0.3502795      
    ##                                          
    ##                   Kappa : 0.2121         
    ##                                          
    ##  Mcnemar's Test P-Value : 0.0008741      
    ##                                          
    ##             Sensitivity : 1.0000         
    ##             Specificity : 0.1333         
    ##          Pos Pred Value : 0.8898         
    ##          Neg Pred Value : 1.0000         
    ##              Prevalence : 0.8750         
    ##          Detection Rate : 0.8750         
    ##    Detection Prevalence : 0.9833         
    ##       Balanced Accuracy : 0.5667         
    ##                                          
    ##        'Positive' Class : no             
    ## 

The oversampled model ended up creating the same predictions as the original model, which again is a good accuracy score, but doesn’t mean that the model is necessarily useful.  
The box and whisker plots below demonstrate the accuracy and kappa for repeated attempts at training each model. For all three, the median kappa values are very low, implying that the models themselves didn’t improve prediction much beyond predicting only the majority class.
<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-11-1.png" width="672" />
I found one interesting insight when plotting the variable importance for each model. Variable importance in the Caret package ranges from 0-100. Notice in the plot below, variable importance is much higher in oversampled model than in the undersampled and original models. This suggests that the model *did* learn some sort of pattern for prediction. However, the predictions from that model didn’t change from those in the original model.
<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-12-1.png" width="672" />
Based on this brief analysis, it appears that unaccounted for variables such as artist popularity, genre, and possibly the relationship between genre and year, do much of the heavy lifting for a song’s success. And honestly no surprise there. This would explain why artists artists don’t (or do) feel comfortable changing their styles.
