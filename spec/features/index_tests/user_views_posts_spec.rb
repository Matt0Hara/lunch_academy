require "rails_helper"

feature "user views the home page", %{
  As a user
  I want to view a list of meetup posts
  so I can meetup with other users
  } do
    before :each do
      FactoryGirl.create(:user)
    end
    scenario "unauthorized user views a list of posts" do
      meetup_1 = FactoryGirl.create(:meetup)
      meetup_2 = FactoryGirl.create(:meetup)
      meetup_3 = FactoryGirl.create(:meetup)

      visit meetups_path
      expect(page).to have_content(meetup_1.title)
      expect(page).to have_content(meetup_2.title)
      expect(page).to have_content(meetup_3.title)
    end

    scenario "authorized user views a list of posts" do

      meetup_1 = FactoryGirl.create(:meetup)
      meetup_2 = FactoryGirl.create(:meetup)
      meetup_3 = FactoryGirl.create(:meetup)

      visit meetups_path
      expect(page).to have_content(meetup_1.title)
      expect(page).to have_content(meetup_2.title)
      expect(page).to have_content(meetup_3.title)
    end

    scenario "user uses infinite scroll", js: true do
      target_meetup = FactoryGirl.create(:meetup)
      20.times do
        FactoryGirl.create(:meetup)
      end
      visit meetups_path
      expect(page).to_not have_content(target_meetup.title)
      save_screenshot("public/uploads/capybara-js.png")
      page.execute_script("window.scrollTo(0, 10000)")
      expect(page).to have_content(target_meetup.title)
    end
end
