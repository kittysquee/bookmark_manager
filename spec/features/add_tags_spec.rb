feature 'Add tags' do
  scenario 'Allows a user to add tags to a link' do
  visit '/links/new'
  fill_in(:title, :with => 'Yahoo')
  fill_in(:url, :with => 'https://uk.yahoo.com/')
  fill_in(:tag, with: 'search engine')
  click_button('Create Link')
  expect(current_path).to eq '/links'
  within 'ul#links' do
    expect(page).to have_content('search engine')
  end
end
end
