describe 'wiki/show' do
  let(:wiki) do
    assign :wiki, stub_model(
        Wiki,
        title: 'MyString',
        text: 'MyText',
        seo_metadata:
          stub_model(
            SeoMetadata,
            keywords: 'some keywords',
            description: 'some description'))
  end
  before { @wiki = wiki }
  before { render template: 'wiki/show', layout: 'layouts/application' }
  subject(:page) { Capybara.string rendered }

  it 'renders attributes in <h3> and <div>' do
    is_expected.to have_selector 'h3',  text: 'MyString'
    is_expected.to have_selector 'div', text: 'MyText'
  end

  context 'with metadata' do
    let(:page_title)       { wiki.title                    }
    let(:meta_keywords)    { wiki.seo_metadata.keywords    }
    let(:meta_description) { wiki.seo_metadata.description }

    it 'must have SEO meta data' do
      is_expected.to have_selector 'head title', text: page_title, visible: false
      is_expected.to have_selector "head meta[name='Keywords'   ][content='#{meta_keywords}']",    visible: false
      is_expected.to have_selector "head meta[name='Description'][content='#{meta_description}']", visible: false
    end
  end
end
