# Word Definer

#### _Epicodus Project in Ruby, September 15, 2017_

#### By Kelsey Langlois

## Description

_A Ruby Web App that creates a custom dictionary. Users can enter words and add definitions to them. The homepage shows a searchable list of words, and users can click on a word to view or add definitions. Users can also clear the list of words by selecting "Clear Dictionary"._

## Setup/Installation Requirements

_You can find this app online [here](https://floating-stream-23611.herokuapp.com/). To set up on your own computer, follow the instructions below._

* Clone this repository
* From the project root directory, run ```ruby app.rb```
* Open ```localhost:4567``` in your web browser.

## Specifications

#### ```WordDefiner::Word```

_Underlying class that the application uses to store and find words and their definitions._

##### Class Methods

##### ```.new(attributes)```
* _Creates a new Word object. ```attributes``` is a Hash, and must include a key-value pair ```:term => "term"```. Optionally, attributes can include ```:definition => "definition"``` (if this is not included, word is initialized without a definition)._
  * Example Input:
    ```
    anagram = Word.new({:term => "Anagram"})
    ```
  * Example Output:
    ```
    anagram.term = "Anagram"
    anagram.definitions = []
    ```
  * Example Input:
    ```
    anagram = Word.new({:term => "Palindrome", :definition => "A type of word"})
    ```
  * Example Output:
    ```
    anagram.term = "Palindrome"
    anagram.definitions = ["A type of word"]
    ```

##### ```.all```
* _Returns a list of the terms of all saved words, sorted alphabetically._
  * Example Input:
    ```
    palindrome.save
    anagram.save
    antigram.save
    ```
  * Example Output:
    ```
    Word.all = ["anagram", "antigram", "palindrome"]
    ```

##### ```.clear```
* _Clears list of all saved words._
  * Example Input:
    ```
    Word.clear_all
    ```
  * Example Output:
    ```
    Word.all = []
    ```

##### ```.find(term)```
* _Finds a saved word object by its terms, ignoring case. Returns "Word not found" if term does not match a saved word._
  * Example Input:
    ```
    Word.find("Palindrome")
    ```
  * Example Output:
    ```ruby
    palindrome # Word object with term = "palindrome"
    ```
  * Example Input:
    ```
    Word.find("Oxymoron")
    ```
  * Example Output:
    ```
    "Word not found"
    ```

##### Instance Methods

##### ```#term```
* _Returns a word's term._
  * Example Input:
    ```
    palindrome.term
    ```
  * Example Output:
    ```
    "Palindrome"
    ```

##### ```#definitions```
* _Returns an array of a word's definitions_
  * Example Input:
    ```
    palindrome.definitions
    ```
  * Example Output:
    ```
    ["A type of word"]
    ```

##### ```#add_definition```
* _Adds a definition to the word's list of definitions._
  * Example Input:
    ```
    palindrome.add_definition("A word that equals its reverse.")
    ```
  * Example Output:
    ```
    palindrome.definitions = ["A type of word", "A word that equals its reverse."]
    ```

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Sinatra

### License

Copyright (c) 2017 **Kelsey Langlois**

*This software is licensed under the MIT license.*
