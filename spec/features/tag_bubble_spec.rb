feature 'Tag bubble' do
  scenario 'checks links that are tagged with bubble' do
    visit '/links/new'
    fill_in(:title, with: 'Yahoo')
    fill_in(:url, with: 'https://uk.yahoo.com/')
    fill_in(:tags, with: 'search engine')
    click_button('Create Link')

    visit '/links/new'
    fill_in(:title, with: 'sausage')
    fill_in(:url, with: 'www.sausage.com')
    fill_in(:tags, with: 'bubbles')
    click_button('Create Link')

    visit '/tags/bubbles'
    expect(page).to have_content('bubbles')
    expect(page).to_not have_content('search engine')
  end
end
