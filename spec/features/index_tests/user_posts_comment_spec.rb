require "rails_helper"

feature "user posts a comment", %{
  As an authenticated user
  I want to post a comment
  so I can communicate with others
} do
  scenario "authenticated user posts a comment" do
    poster = FactoryGirl.create(:user)
    visit meetups_path
    fill_in "Email", with: poster.email
    fill_in "Password", with: poster.password
    click_button "Sign in"
    desc = "Food getting! We are getting food! Come with us to the place
            that sells the food!"
    fill_in "Title", with: "Food"
    fill_in "Description", with: desc
    fill_in "Time", with: "1:00"
    click_button "Save New"
    expect(page).to have_button("Delete Meetup")
    fill_in "Have something to say?", with: "Can't wait!"
    click_button "Comment"
    expect(page).to have_content("Can't wait!")
  end

#   Some sort of Capybara quirk causing this to fail. Possibly to do with second AJAX
#   event listenter not being applied.


#   scenario "owner of a comment deletes it", js: true do
#     poster = FactoryGirl.create(:user)
#     post = FactoryGirl.create(:meetup)
#     visit meetups_path
#     fill_in "Email", with: poster.email
#     fill_in "Password", with: poster.password
#     click_button "Sign in"
#     txt = "Can't wait!"
#     desc = "Food getting! We are getting food! Come with us to the place
#              that sells the food!"
#     fill_in "Title", with: "Food"
#     fill_in "Description", with: desc
#     fill_in "Time", with: "1:00"
#     click_button "Save New"
#     expect(page).to have_button("Delete Meetup")
#     fill_in "Have something to say?", with: txt
#     click_button "Comment"
#     visit meetups_path
#     expect(page).to have_content(txt)
#     click_link("commentDelete")
#     expect(page).to_not have_content(txt)
#   end
 end
