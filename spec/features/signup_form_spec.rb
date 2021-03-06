feature 'Signup Form' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome freddy@freddy.com')
    expect(User.first.email).to eq('freddy@freddy.com')
  end

  scenario 'Requires matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
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

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.to change(User, :count).by 0
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario "I cna't sign up with an existing email" do
    sign_up
    expect{ sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
