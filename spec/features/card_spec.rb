require 'rails_helper'

feature "Test card validity :" do
  scenario "Form lead to create a card associated to the holder" do
    visit "/"
    within("#obtain-card") do
      fill_in('name', :with => 'Joseph')
      fill_in('email', :with => 'Joeseph@gmail.com')
      click_button 'Get your card'
    end
    expect(page).to have_xpath("//div[@holder='Joseph']")
    expect(page).to have_xpath("//div[@currentcharge='0']")
  end

  scenario "Cards are in good shape" do
    visit "/"
    within("#obtain-card") do
      fill_in('name', :with => 'Joseph')
      fill_in('email', :with => 'Joeseph@gmail.com')
      click_button 'Get your card'
    end
    expect(page).to have_css('.card > .cap')
    expect(page).to have_css('.card > .cafe-container > .cafe-slot')
    for i in 1...8
      expect(page).to have_css("#coffee#{i}")
     end
    for i in list = ["uno", "deux", "sān", "apat", "cinco", "yeoseot", "nana", "發"]
      expect(page).to have_content("#{i}")
    end
  end
end