---
title: "Untitled"
author: "Mallory Dickerson"
date: "9/3/2022"
output: 
  html_document:
    keep_md: true
---


```r
?iris
```

```
## starting httpd help server ... done
```

```r
str(iris)
```

```
## 'data.frame':	150 obs. of  5 variables:
##  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
##  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
##  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
##  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
##  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```

```r
library(tidyverse)
```

```
## -- Attaching packages --------------------------------------- tidyverse 1.3.1 --
## v ggplot2 3.3.5     v purrr   0.3.4
## v tibble  3.1.6     v dplyr   1.0.7
## v tidyr   1.1.4     v stringr 1.4.0
## v readr   2.1.1     v forcats 0.5.1
## -- Conflicts ------------------------------------------ tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width, color = Species, shape = Species))



ggplot(data = iris) +
  geom_point(mapping = aes(x = Petal.Width, y = Petal.Length, color = Species, shape = Species)) +
  facet_wrap(~ Species, nrow = 2)

ggplot(data = iris) +
  geom_point(mapping = aes(x = Petal.Length, y = Petal.Width, color = Species, shape = Species))+
  geom_smooth(method = lm, mapping = aes(x = Petal.Length, y = Petal.Width))


ggplot(iris)+
  geom_histogram(alpha = 1, mapping = aes(x = Sepal.Length, fill = Species), color = "black")+
  geom_vline(aes(xintercept = mean(Sepal.Length)))


my driving question associated to my visualizations
Do plant species fall into identifiable categories based on petal and sepal lengths and widths?

The visulaziations demonstrates clear groupings of plant species using the mentioned characteristics.
  
