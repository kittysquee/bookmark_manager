feature 'Signup Form' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome freddy@freddy.com')
    expect(User.first.email).to eq('freddy@freddy.com')
  end
end
