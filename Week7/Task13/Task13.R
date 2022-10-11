library(tidyverse)
library(readr)
library(stringr)

RandomLetters <- read_lines("https://github.com/WJC-Data-Science/DTS350/raw/master/randomletters.txt")

RandomLettersNumbers <- read_lines("https://github.com/WJC-Data-Science/DTS350/raw/master/randomletters_wnumbers.txt")

#getting the hidden quote
hidden_quote <- c()
for (i in seq(1, str_length(RandomLetters)/1700)) {
  if (i == 1) {
    hidden_quote <- str_c(hidden_quote, str_sub(RandomLetters, start = 1, end = 1))
  }
  hidden_quote <- str_c(hidden_quote, str_sub(RandomLetters, start = i*1700, end = i*1700))
  if (str_sub(RandomLetters, start = i*1700, end = i*1700) == ".") {
    break
  }
}
hidden_quote

?letters
#changing the numbers to letters to decipher the hidden quote
num <- str_extract_all(RandomLettersNumbers, "\\d{1,2}")
number_change <- c()
for (i in seq(1,length(num[[1]]))) {
  number_change[i] = letters[as.numeric(num[[1]][i])]
}
number_change <- paste(number_change, collapse = " ")
number_change

#longest palindrome
str_extract_all(RandomLetters, "(.)(.)(.)(.)\\4\\3\\2\\1")

#longest sequence of vowels

#first removing all periods and spaces
removed_characters_RL <- RandomLetters %>%
  str_remove_all("\\.") %>%
  str_remove_all(" ")

vowels <- c()
vowels <- unlist(str_extract_all(removed_characters_RL,"([aeiou])+"))

for (i in seq(1,length(vowels))) {
  if (str_length(vowels[i]) > str_length(longest_sequence[length(longest_sequence)])) {
    longest_sequence <- vowels[i]
  }
}
longest_sequence
