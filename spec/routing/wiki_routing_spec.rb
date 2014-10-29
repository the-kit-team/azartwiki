describe WikiController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/wiki').to route_to('wiki#index')
    end

    it 'routes to #new' do
      expect(get: '/wiki/new').to route_to('wiki#new')
    end

    it 'routes to #show' do
      expect(get: '/wiki/1').to route_to('wiki#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/wiki/1/edit').to route_to('wiki#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/wiki').to route_to('wiki#create')
    end

    it 'routes to #update' do
      expect(put: '/wiki/1').to route_to('wiki#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/wiki/1').to route_to('wiki#destroy', id: '1')
    end
  end
end
