describe 'wiki/index' do
  before do
    assign :wiki, [
      stub_model(Wiki, title: 'Title', text: 'MyText'),
      stub_model(Wiki, title: 'Title', text: 'MyText')
    ]
  end
  before { render template: 'wiki/index', layout: 'layouts/application' }
  subject(:page) { Capybara.string rendered }

  it 'renders a list of wiki' do
    is_expected.to have_selector 'tr td', text:  'Title', count: 2
    is_expected.to have_selector 'tr td', text: 'MyText', count: 2
  end
end
