describe 'wiki/edit' do
  let(:wiki) do
    assign :wiki, stub_model(Wiki, title: 'MyString', text: 'MyText')
  end
  before { @wiki = wiki }
  before { render }
  subject(:page) { Capybara.string rendered }

  it 'renders the edit wiki form' do
    is_expected.to have_selector "form[action='#{wiki_path(wiki)}'][method='post']" do |form|
      expect(form).to have_selector 'input#wiki_title',   name: 'wiki[title]'
      expect(form).to have_selector 'textarea#wiki_text', name: 'wiki[text]'
    end
  end
end
