---
title: "Task4"
author: "Mallory Dickerson"
date: "9/7/2022"
output: 
  html_document:
    theme: cosmo
    keep_md: true
---


```r
library(tidyverse)
```

```
## -- Attaching packages --------------------------------------- tidyverse 1.3.1 --
```

```
## v ggplot2 3.3.5     v purrr   0.3.4
## v tibble  3.1.6     v dplyr   1.0.7
## v tidyr   1.1.4     v stringr 1.4.0
## v readr   2.1.1     v forcats 0.5.1
```

```
## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(knitr)
?iris
```

```
## starting httpd help server ...
```

```
##  done
```


```r
iris_data <- as_tibble(iris)
```


```r
arr_SL <- arrange(iris_data, (Sepal.Length))
arr_SL
```

```
## # A tibble: 150 x 5
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
##           <dbl>       <dbl>        <dbl>       <dbl> <fct>  
##  1          4.3         3            1.1         0.1 setosa 
##  2          4.4         2.9          1.4         0.2 setosa 
##  3          4.4         3            1.3         0.2 setosa 
##  4          4.4         3.2          1.3         0.2 setosa 
##  5          4.5         2.3          1.3         0.3 setosa 
##  6          4.6         3.1          1.5         0.2 setosa 
##  7          4.6         3.4          1.4         0.3 setosa 
##  8          4.6         3.6          1           0.2 setosa 
##  9          4.6         3.2          1.4         0.2 setosa 
## 10          4.7         3.2          1.3         0.2 setosa 
## # ... with 140 more rows
```


```r
testdat <- select(iris_data, Species, Petal.Width)
testdat
```

```
## # A tibble: 150 x 2
##    Species Petal.Width
##    <fct>         <dbl>
##  1 setosa          0.2
##  2 setosa          0.2
##  3 setosa          0.2
##  4 setosa          0.2
##  5 setosa          0.2
##  6 setosa          0.4
##  7 setosa          0.3
##  8 setosa          0.2
##  9 setosa          0.2
## 10 setosa          0.1
## # ... with 140 more rows
```


```r
species_mean <- iris_data %>%
  group_by(Species) %>%
  summarize(mean(Sepal.Length), mean(Sepal.Width), mean(Petal.Length), mean(Petal.Width))
species_mean
```

```
## # A tibble: 3 x 5
##   Species    `mean(Sepal.Le~` `mean(Sepal.Wi~` `mean(Petal.Le~` `mean(Petal.Wi~`
##   <fct>                 <dbl>            <dbl>            <dbl>            <dbl>
## 1 setosa                 5.01             3.43             1.46            0.246
## 2 versicolor             5.94             2.77             4.26            1.33 
## 3 virginica              6.59             2.97             5.55            2.03
```


```r
select_iris <- select(iris_data, Species, Sepal.Width, Petal.Width, Sepal.Length, Petal.Length)
iris_min <- filter(select_iris, Sepal.Width >= 3, Petal.Width != 2.5)
iris_min
```

```
## # A tibble: 90 x 5
##    Species Sepal.Width Petal.Width Sepal.Length Petal.Length
##    <fct>         <dbl>       <dbl>        <dbl>        <dbl>
##  1 setosa          3.5         0.2          5.1          1.4
##  2 setosa          3           0.2          4.9          1.4
##  3 setosa          3.2         0.2          4.7          1.3
##  4 setosa          3.1         0.2          4.6          1.5
##  5 setosa          3.6         0.2          5            1.4
##  6 setosa          3.9         0.4          5.4          1.7
##  7 setosa          3.4         0.3          4.6          1.4
##  8 setosa          3.4         0.2          5            1.5
##  9 setosa          3.1         0.1          4.9          1.5
## 10 setosa          3.7         0.2          5.4          1.5
## # ... with 80 more rows
```


```r
iris_size <- mutate(iris_data, size = case_when(Sepal.Length < 5 ~ "Small",
                                                Sepal.Length >= 5 & Sepal.Length < 6.5 ~ "Medium",
                                                Sepal.Length >= 6.5 ~ "Large"))

iris_size
```

```
## # A tibble: 150 x 6
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species size  
##           <dbl>       <dbl>        <dbl>       <dbl> <fct>   <chr> 
##  1          5.1         3.5          1.4         0.2 setosa  Medium
##  2          4.9         3            1.4         0.2 setosa  Small 
##  3          4.7         3.2          1.3         0.2 setosa  Small 
##  4          4.6         3.1          1.5         0.2 setosa  Small 
##  5          5           3.6          1.4         0.2 setosa  Medium
##  6          5.4         3.9          1.7         0.4 setosa  Medium
##  7          4.6         3.4          1.4         0.3 setosa  Small 
##  8          5           3.4          1.5         0.2 setosa  Medium
##  9          4.4         2.9          1.4         0.2 setosa  Small 
## 10          4.9         3.1          1.5         0.1 setosa  Small 
## # ... with 140 more rows
```


```r
iris_rank <- select(iris, Petal.Length) %>%
  arrange(Petal.Length) %>%
  mutate(rank = min_rank(Petal.Length))

iris_rank
```

```
##     Petal.Length rank
## 1            1.0    1
## 2            1.1    2
## 3            1.2    3
## 4            1.2    3
## 5            1.3    5
## 6            1.3    5
## 7            1.3    5
## 8            1.3    5
## 9            1.3    5
## 10           1.3    5
## 11           1.3    5
## 12           1.4   12
## 13           1.4   12
## 14           1.4   12
## 15           1.4   12
## 16           1.4   12
## 17           1.4   12
## 18           1.4   12
## 19           1.4   12
## 20           1.4   12
## 21           1.4   12
## 22           1.4   12
## 23           1.4   12
## 24           1.4   12
## 25           1.5   25
## 26           1.5   25
## 27           1.5   25
## 28           1.5   25
## 29           1.5   25
## 30           1.5   25
## 31           1.5   25
## 32           1.5   25
## 33           1.5   25
## 34           1.5   25
## 35           1.5   25
## 36           1.5   25
## 37           1.5   25
## 38           1.6   38
## 39           1.6   38
## 40           1.6   38
## 41           1.6   38
## 42           1.6   38
## 43           1.6   38
## 44           1.6   38
## 45           1.7   45
## 46           1.7   45
## 47           1.7   45
## 48           1.7   45
## 49           1.9   49
## 50           1.9   49
## 51           3.0   51
## 52           3.3   52
## 53           3.3   52
## 54           3.5   54
## 55           3.5   54
## 56           3.6   56
## 57           3.7   57
## 58           3.8   58
## 59           3.9   59
## 60           3.9   59
## 61           3.9   59
## 62           4.0   62
## 63           4.0   62
## 64           4.0   62
## 65           4.0   62
## 66           4.0   62
## 67           4.1   67
## 68           4.1   67
## 69           4.1   67
## 70           4.2   70
## 71           4.2   70
## 72           4.2   70
## 73           4.2   70
## 74           4.3   74
## 75           4.3   74
## 76           4.4   76
## 77           4.4   76
## 78           4.4   76
## 79           4.4   76
## 80           4.5   80
## 81           4.5   80
## 82           4.5   80
## 83           4.5   80
## 84           4.5   80
## 85           4.5   80
## 86           4.5   80
## 87           4.5   80
## 88           4.6   88
## 89           4.6   88
## 90           4.6   88
## 91           4.7   91
## 92           4.7   91
## 93           4.7   91
## 94           4.7   91
## 95           4.7   91
## 96           4.8   96
## 97           4.8   96
## 98           4.8   96
## 99           4.8   96
## 100          4.9  100
## 101          4.9  100
## 102          4.9  100
## 103          4.9  100
## 104          4.9  100
## 105          5.0  105
## 106          5.0  105
## 107          5.0  105
## 108          5.0  105
## 109          5.1  109
## 110          5.1  109
## 111          5.1  109
## 112          5.1  109
## 113          5.1  109
## 114          5.1  109
## 115          5.1  109
## 116          5.1  109
## 117          5.2  117
## 118          5.2  117
## 119          5.3  119
## 120          5.3  119
## 121          5.4  121
## 122          5.4  121
## 123          5.5  123
## 124          5.5  123
## 125          5.5  123
## 126          5.6  126
## 127          5.6  126
## 128          5.6  126
## 129          5.6  126
## 130          5.6  126
## 131          5.6  126
## 132          5.7  132
## 133          5.7  132
## 134          5.7  132
## 135          5.8  135
## 136          5.8  135
## 137          5.8  135
## 138          5.9  138
## 139          5.9  138
## 140          6.0  140
## 141          6.0  140
## 142          6.1  142
## 143          6.1  142
## 144          6.1  142
## 145          6.3  145
## 146          6.4  146
## 147          6.6  147
## 148          6.7  148
## 149          6.7  148
## 150          6.9  150
```


```r
?summarize_all()

species_m_sd <- iris_data %>%
  group_by(Species) %>%
  summarize(mean(Sepal.Length), mean(Sepal.Width), mean(Petal.Length), mean(Petal.Width), sd(Sepal.Length), sd(Sepal.Width), sd(Petal.Length), sd(Petal.Width))

species_m_sd
```

```
## # A tibble: 3 x 9
##   Species    `mean(Sepal.Le~` `mean(Sepal.Wi~` `mean(Petal.Le~` `mean(Petal.Wi~`
##   <fct>                 <dbl>            <dbl>            <dbl>            <dbl>
## 1 setosa                 5.01             3.43             1.46            0.246
## 2 versicolor             5.94             2.77             4.26            1.33 
## 3 virginica              6.59             2.97             5.55            2.03 
## # ... with 4 more variables: `sd(Sepal.Length)` <dbl>, `sd(Sepal.Width)` <dbl>,
## #   `sd(Petal.Length)` <dbl>, `sd(Petal.Width)` <dbl>
```


Questions:
Is belief in conspiracy theories related to IQ?

What impacts do population control have on environmental pollution and or resource depletion?

My friends who are all females between the ages of 21 and 22 thought the questions were interesting, one of the nurses mentioned that the population control study could be controversial. My parents thought it would be interesting to see the relationship between IQ and belief in conspiracy theories.

Other people looking into the questions:
https://www.inverse.com/article/38403-conspiracy-theory-intelligence-rationality

https://www.science.org.au/curious/earth-environment/population-environment

Professional feedback:
The conspiracy theory question would not be challenging in terms of the survey instrument, but partitioning the population into varying IQ levels would be difficult. One might have to alter it to look at education level rather than IQ. If conducted that way it most likely could be done in 2 months.

The second question most definitely could not be done in 2 months. You could look at existing data from say like China before and after they lifted population control laws. If done that way it may be able to be conducted in 2 months. Professional thinks this question is urgent because we are faced with environmental catastrophe. 



