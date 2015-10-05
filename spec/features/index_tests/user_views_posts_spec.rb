require 'rails_helper'

feature 'user views the home page', %{
  As a user
  I want to view a list of meetup posts
  so I can meetup with other users
  } do
    scenario 'unauthorized user views a list of posts' do
      meetup_1 = FactoryGirl.create(:meetup)
      meetup_2 = FactoryGirl.create(:meetup)
      meetup_3 = FactoryGirl.create(:meetup)

      visit meetups_path
      expect(page).to have_content(meetup_1.title)
      expect(page).to have_content(meetup_2.title)
      expect(page).to have_content(meetup_3.title)
    end

    scenario 'authorized user views a list of posts' do
      user_1 = FactoryGirl.create(:user)
      meetup_1 = FactoryGirl.create(:meetup)
      meetup_2 = FactoryGirl.create(:meetup)
      meetup_3 = FactoryGirl.create(:meetup)

      visit meetups_path
      expect(page).to have_content(meetup_1.title)
      expect(page).to have_content(meetup_2.title)
      expect(page).to have_content(meetup_3.title)
    end


end
