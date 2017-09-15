require './app'
require 'capybara/rspec'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Word Definer', {:type => :feature}) do
  it "doesn't let user add a blank word to list" do
    visit("/")
    fill_in("term", :with => "")
    click_button("Add!")
    expect(page).to have_content("Please Enter a Word")
  end

  it "adds a word with no definition to the list when only a word is inputted" do
    visit("/")
    fill_in("term", :with => "Antigrams")
    click_button("Add!")
    expect(page).to have_content("Antigrams")
    click_link("Antigrams")
    expect(page).to have_content("Antigrams Add a Definition")
  end

  it "adds a word and definition when definition is inputted as well" do
    visit("/")
    fill_in("term", :with => "Anagrams")
    fill_in("definition", :with => "Two words with the same letters.")
    click_button("Add!")
    click_link("Anagrams")
    expect(page).to have_content("Anagrams")
    expect(page).to have_content("Two words with the same letters.")
  end

  it "displays words in alphabetical order" do
    test_terms = ["Anagrams", "Palindrome", "Antigrams"]
    visit("/")
    test_terms.each do |term|
      fill_in("term", :with => term)
      click_button("Add!")
    end
    expect(page).to have_content("Anagrams Antigrams Palindrome")
  end

  it "lets user add multiple definitions to a word" do
    visit("/")
    fill_in("term", :with => "Palindrome")
    fill_in("definition", :with => "A word that spells the same thing backward and forward.")
    click_button("Add!")
    click_link("Palindrome")
    fill_in("definition", :with => "A word that equals its reverse.")
    expect(page).to have_content("A word that spells the same thing backward and forward.")
    click_button("Add!")
    expect(page).to have_content("A word that equals its reverse.")
  end

  it "doesn't let user enter blank definition on word page" do
    visit("/")
    fill_in("term", :with => "Palindrome")
    click_button("Add!")
    click_link("Palindrome")
    click_button("Add!")
    expect(page).to have_content("Please Enter a Definition")
  end

  it "lets user search for a word by its term" do
    visit("/")
    fill_in("search-term", :with => "Palindrome")
    click_button("search", :id)
    expect(page).to have_content("Search Results: Palindrome")
  end

  it "informs user when it doesn't find a word" do
    visit("/")
    fill_in("search-term", :with => "Oxymoron")
    click_button("search", :id)
    expect(page).to have_content("Search Results: Word not found")
  end

  it "lets user clear word list" do
    visit("/")
    visit("/")
    fill_in("term", :with => "Palindrome")
    click_button("Add!")
    click_link("Clear Dictionary")
    click_button("Clear All")
    expect(page).to have_no_content("Palindrome")
  end
end
