feature 'Add tags' do
  scenario 'Allows a user to add tags to a link' do
    visit '/links/new'
    fill_in(:title, :with => 'Yahoo')
    fill_in(:url, :with => 'https://uk.yahoo.com/')
    fill_in(:tags, with: 'search-engine')

    click_button('Create Link')
    link = Link.first
      expect(link.tags.map(&:name)).to include('search-engine')
  end

  scenario 'Allows a user to add multiple tags' do
    visit '/links/new'
    fill_in(:title, :with => 'Yahoo')
    fill_in(:url, :with => 'https://uk.yahoo.com/')
    fill_in(:tags, with: 'search-engine average-site')

    click_button('Create Link')
    link = Link.first
    expect(link.tags.map(&:name)).to include('search-engine')
    expect(link.tags.map(&:name)).to include('average-site')
  end
end
