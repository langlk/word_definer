# Word Definer

#### _Epicodus Project in Ruby, September 15, 2017_

#### By Kelsey Langlois

## Description

_A Ruby Web App that creates a custom dictionary. Users can enter words and add definitions to them. The homepage shows a list of words, and each word's definitions can be viewed._

## Setup/Installation Requirements

_You can find this app online [here](https://floating-stream-23611.herokuapp.com/). To set up on your own computer, follow the instructions below._

* Clone this repository
* From the project root directory, run ```ruby app.rb```
* Open ```localhost:4567``` in your web browser.

## Specifications

* Program stores a word inputted by the user.
  * Example input: "Palindrome"
  * Example output: new Word "Palindrome"
* Program raises an error if user does not provide a word.
  * Example input: ""
  * Example output: ArgumentError: Must provide a word.
* Program lets user input definitions for a word
  * Example input: palindrome.add_definition("A word or phrase that equals its reverse.")
  * Example output: palindrome.definition = ["A word or phrase that says the same thing when reversed.", "A word or phrase that equals its reverse."]
* Program shows a list of all saved words, sorted alphabetically.
  * Example input: palindrome.save, anagram.save, antigram.save
  * Example output: Word.all = ["Anagram", "Antigram", "Palindrome"]
* Program can clear the list of words.
  * Example input: Word.clear_all
  * Example output: Word.all = []
* Program can find a word object by its term.
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
* Sinatra

### License

Copyright (c) 2017 **Kelsey Langlois**

*This software is licensed under the MIT license.*
