describe Wiki do
  describe 'GET /wiki' do
    it 'works! (now write some real specs)' do
      get wiki_index_path
      expect(response).to have_http_status(200)
    end
  end
end
