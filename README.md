# Word Definer

#### _Epicodus Project in Ruby, September 15, 2017_

#### By Kelsey Langlois

## Description

_A Ruby Web App_

## Setup/Installation Requirements

* Clone this repository

## Specifications

* Program stores a word inputted by the user.
  * Example input: "Palindrome"
  * Example output: new Word "Palindrome"
* Program lets user input a definition for a word.
  * Example input: palindrome.add_definition("A word or phrase that says the same thing when reversed.")
  * Example output: palindrome.definitions = ["A word or phrase that says the same thing when reversed."]
* Program lets user input multiple definitions for a word
  * Example input: palindrome.add_definition("A word or phrase that equals its reverse.")
  * Example output: palindrome.definition = ["A word or phrase that says the same thing when reversed.", "A word or phrase that equals its reverse."]
* Program shows a list of all saved words.
  * Example input: palindrome.save, anagram.save, antigram.save
  * Example output: Word.all = ["Palindrome", "Anagram", "Antigram"]
* Program can clear the list of words.
  * Example input: Word.clear_all
  * Example output: Word.all = []
* Program can find a word by its term.
  * Example input: Word.find("Palindrome")
  * Example output: palindrome
* Program ignores case when finding a word.
  * Example input: Word.find("PALINDROME")
  * Example output: palindrome
* Program returns "word not found" if word is not saved in list.
  * Example input: Word.find("potato")
  * Example output: "Word not found"

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby

### License

Copyright (c) 2017 **Kelsey Langlois**

*This software is licensed under the MIT license.*
