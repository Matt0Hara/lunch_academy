require "rails_helper"

feature "Create meetup", %{
  As an authenticated user
  I want to create a meetup
  so that I can connect with people
} do
  scenario "unauthorized user tries to create a meetup" do
    visit meetups_path
    desc = "Oh yeah, im gonna get some tacos and my
            mom can't tell me I can't because I am an adult"
    fill_in "Title", with: "Title!"
    fill_in "Description", with: desc
    fill_in "Time", with: "11:00"
    click_button("Save New")
    expect(page).to_not have_content(desc)
    expect(page).to have_content("You need to sign in to do that!")
  end

  scenario "authorized user successfully creates a meetup" do
    user = FactoryGirl.create(:user)
    visit meetups_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("Sign in")
    desc = "Oh yeah, im gonna get some tacos and my
            mom can't tell me I can't because I am an adult"
    fill_in "Title", with: "Title!"
    fill_in "Description", with: desc
    fill_in "Time", with: "11:00"
    click_button "Save New"
    expect(page).to have_content(desc)
  end

  scenario "authorized user tries to create a meetup without a title" do
    user = FactoryGirl.create(:user)
    visit meetups_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("Sign in")
    desc = "Oh yeah, im gonna get some tacos and my
            mom can't tell me I can't because I am an adult"
    fill_in "Description", with: desc
    fill_in "Time", with: "11:00"
    click_button "Save New"
    expect(page).to_not have_content(desc)
    expect(page).to have_content("Title can't be blank")
  end

  scenario "authorized user tries to create a meetup with a description of
            insufficient length" do
    user = FactoryGirl.create(:user)
    visit meetups_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("Sign in")
    fill_in "Title", with: "Title!"
    fill_in "Description", with: "hi"
    fill_in "Time", with: "11:00"
    click_button "Save New"
    expect(page).to_not have_content("hi")
    expect(page).to have_content("Description is too short
                                 (minimum is 20 characters)")
  end

  scenario "authorized user tries to create a meetup without a description" do
    user = FactoryGirl.create(:user)
    visit meetups_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("Sign in")
    fill_in "Title", with: "Title!"
    fill_in "Time", with: "11:00"
    click_button "Save New"
    expect(page).to_not have_content("Title!")
    expect(page).to have_content("Description is too short (minimum is 20
                                 characters). Description can't be blank")
  end

  scenario "authorized user tries to create a meetup without a time" do
    user = FactoryGirl.create(:user)
    visit meetups_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("Sign in")
    fill_in "Title", with: "Title!"
    desc = "Oh yeah, im gonna get some tacos and my
            mom can't tell me I can't because I am an adult"
    fill_in "Description", with: desc
    click_button "Save New"
    expect(page).to_not have_content(desc)
    expect(page).to have_content("Datetime can't be blank")
  end
end
