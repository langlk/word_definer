require './app'
require 'capybara/rspec'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Word Definer', {:type => :feature}) do
  it "adds a word with no definition to the list when only a word is inputted" do
    visit("/")
    fill_in("term", :with => "Test123")
    click_button("Add!")
    expect(page).to have_content("Test123")
    click_link("Test123")
    expect(page).to have_content("Test123 Add a Definition")
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
end