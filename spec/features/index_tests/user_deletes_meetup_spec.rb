require "rails_helper"

feature "Deletes a meetup", %{
  As an authenticated users
  I want to delete a meetup
  So that I can avoid people
} do
  scenario "user sees delete button" do
    user = FactoryGirl.create(:user)
    visit meetups_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("Sign in")
    desc = "This is a description, man. The kind of description you have to
            just stop and appreciate. Breathe it in, it always goes down
             smooth."
    fill_in "Title", with: "testuser@test.com"
    fill_in "Description", with: desc
    fill_in "Time", with: "1:00"
    click_button "Save New"
    expect(page).to have_content(desc)
    expect(page).to have_button("Delete Meetup")
  end

  scenario "unauthorized user tries to delete another user's post" do
    visit meetups_path
    expect(page).to_not have_button("Delete Meetup")
  end

  scenario "unauthorized user tries to delete another user's post" do
    FactoryGirl.create(:meetup)
    visit meetups_path
    expect(page).to_not have_button("Delete Meetup")
  end
end
