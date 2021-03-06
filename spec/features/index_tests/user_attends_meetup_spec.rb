require "rails_helper"

feature "Attend a posted meetup", %{
  As an authenticated user
  I want to attend a Meetup
  So that I can meetup with people
  } do
  scenario "authenicated user attends a meetup" do
    FactoryGirl.create(:user)
    meetup_attendee = FactoryGirl.create(:user)
    FactoryGirl.create(:meetup)
    visit meetups_path
    fill_in "Email", with: meetup_attendee.email
    fill_in "Password", with: meetup_attendee.password
    click_button "Sign in"
    click_button "Join Meetup!"
    expect(page).to have_button("Leave Meetup")
  end

  scenario "authenticated user leaves a meetup they are attending" do
    FactoryGirl.create(:user)
    meetup_attendee = FactoryGirl.create(:user)
    meetup = FactoryGirl.create(:meetup)
    visit meetups_path
    fill_in "Email", with: meetup_attendee.email
    fill_in "Password", with: meetup_attendee.password
    click_button "Sign in"
    click_button "Join Meetup!"
    expect(page).to have_button("Leave Meetup")
    click_button "Leave Meetup"
    expect(page).to_not have_button("Leave Meetup")
  end

  scenario "unauthenticated user tries to join a meetup" do
    meetup = FactoryGirl.create(:meetup)
    visit meetups_path
    within("##{meetup.id}") do
      click_button("Join Meetup!")
    end
    expect(page).to have_content("You need to sign in to do that!")
  end
end
