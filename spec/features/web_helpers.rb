def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: 'freddy@freddy.com'
  fill_in :password, with: 'freddy'
  click_button 'Complete Registration'
end
