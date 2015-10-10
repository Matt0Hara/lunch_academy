require "rails_helper"

feature "Attend a posted meetup", %{
  As an authenticated user
  I want to attend a Meetup
  So that I can meetup with people
  } do

    scenario "authenicated user attends a meetup" do
      meetup_owner = FactoryGirl.create(:user)
      meetup_attendee = FactoryGirl.create(:user)
      meetup_1 = FactoryGirl.create(:meetup)
      visit meetups_path
      fill_in "Email", with: meetup_attendee.email
      fill_in "Password", with: meetup_attendee.password
      click_button "Sign in"
      click_button "Join Meetup!"
      #handle changing the Join Meetup! button with ajax, as well as the request
      expect(page).to have_button("Leave meetup")
    end




end
