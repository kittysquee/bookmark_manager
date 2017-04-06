feature 'Signup Form' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome freddy@freddy.com')
    expect(User.first.email).to eq('freddy@freddy.com')
  end

  scenario 'Requires matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Passwords do not match'
  end

  def sign_up(email: 'freddy@freddy.com',
              password: 'freddy',
              password_confirmation: 'freddy' )
    visit 'users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Complete Registration'
  end
end
