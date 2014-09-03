require 'rails_helper'

feature "Test home page goals:" do
  scenario "Existence of the logo" do
    visit "/"
    expect(page).to have_xpath("//img[@src='recharge_logo.jpg']")
  end

  scenario "Engaging text on the page" do
    visit "/"
    expect(page).to have_content "Text to engage customers"
  end

  scenario "Existence of the form" do
    visit "/"
    expect(find('#obtain-card')).to have_button('Get your card')
  end
end