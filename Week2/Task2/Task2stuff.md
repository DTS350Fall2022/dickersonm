---
title: "Task2"
author: "Mallory Dickerson"
date: "8/31/2022"
output: 
  html_document:
    theme: cosmo
    keep_md: true
---


```r
library(knitr)
```


```r
#calculating the sin(pi/4)
sin(pi/4)
```

```
## [1] 0.7071068
```

```r
x <- 10/3
#
```


```r
MySequence <- seq(1,50, length.out = 7)
MySequence
```

```
## [1]  1.000000  9.166667 17.333333 25.500000 33.666667 41.833333 50.000000
```

```r
my_vector <- c(1,5,12,31,19)
my_vector
```

```
## [1]  1  5 12 31 19
```

```r
7+5 == 12
```

```
## [1] TRUE
```

```r
#the double equals makes it into a boolean
```

```r
#(7 + 4 = 12)|(5 - 4 = 1)
#you can't assign a number as a variable name
```


```r
#question 1
#they made a typo.

#question 2
#library(tidyverse)

#ggplot(dota = mpg) + 
  #geom_point(mapping = aes(x = displ, y = hwy))

#fliter(mpg, cyl = 8)
#filter(diamond, carat > 3)

#more typos

#question 3
#go to "help" then "cheat sheets"
```


```r
library(tidyverse)
```

```
## -- Attaching packages --------------------------------------- tidyverse 1.3.1 --
```

```
## v ggplot2 3.3.5     v purrr   0.3.4
## v tibble  3.1.8     v dplyr   1.0.7
## v tidyr   1.1.4     v stringr 1.4.0
## v readr   2.1.1     v forcats 0.5.1
```

```
## Warning: package 'tibble' was built under R version 4.1.3
```

```
## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
```

![](Task2stuff_files/figure-html/unnamed-chunk-9-1.png)<!-- -->

```r
#filter(mpg, cyl = 8)
#filter(diamond, carat > 3)
```

