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

  context 'with metadata' do
    let(:page_title)       { I18n.t 'wiki.index.page_title'       }
    let(:meta_keywords)    { I18n.t 'wiki.index.meta_keywords'    }
    let(:meta_description) { I18n.t 'wiki.index.meta_description' }

    it 'must have SEO meta data' do
      is_expected.to have_selector 'head title', text: page_title, visible: false
      is_expected.to have_selector "head meta[name='Keywords'   ][content='#{meta_keywords}']",    visible: false
      is_expected.to have_selector "head meta[name='Description'][content='#{meta_description}']", visible: false
    end
  end
end
