describe 'wiki/show' do
  let(:wiki) do
    assign :wiki, stub_model(Wiki, title: 'MyString', text: 'MyText')
  end
  before { @wiki = wiki }
  before { render template: 'wiki/show', layout: 'layouts/application' }
  subject(:page) { Capybara.string rendered }

  it 'renders attributes in <p>' do
    is_expected.to have_selector 'p', text:  'Title'
    is_expected.to have_selector 'p', text: 'MyText'
  end
end
