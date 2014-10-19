describe WikiController do
  let(:admin) { create :admin }

  let(:valid_attributes) do
    { title: 'MyTitle', text: 'MyText' }
  end

  let(:invalid_attributes) do
    { title: '' }
  end

  let(:admin_session) { { user_id: admin.id } }

  describe 'GET index' do
    let(:wiki) { create :wiki }

    it 'assigns all wiki as @wiki' do
      get :index
      expect(response).to render_template :index
      expect(assigns(:wiki)).to eq([wiki])
    end
  end

  describe 'GET show' do
    let(:wiki) { create :wiki }

    it 'assigns the requested wiki as @wiki' do
      get :show, id: wiki.to_param
      expect(response).to render_template :show
      expect(assigns(:wiki)).to eq(wiki)
    end
  end

  describe 'GET new' do
    it 'assigns a new wiki as @wiki' do
      get :new, {}, admin_session
      expect(response).to render_template :new
      expect(assigns(:wiki)).to be_a_new(Wiki)
    end
  end

  describe 'GET edit' do
    let(:wiki) { create :wiki }

    it 'assigns the requested wiki as @wiki' do
      get :edit, { id: wiki.to_param }, admin_session
      expect(response).to render_template :edit
      expect(assigns(:wiki)).to eq(wiki)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Wiki' do
        expect do
          post :create, { wiki: valid_attributes }, admin_session
        end.to change(Wiki, :count).by(1)
      end

      it 'assigns a newly created wiki as @wiki' do
        post :create, { wiki: valid_attributes }, admin_session
        expect(assigns(:wiki)).to be_a(Wiki)
        expect(assigns(:wiki)).to be_persisted
      end

      it 'redirects to the created wiki' do
        post :create, { wiki: valid_attributes }, admin_session
        expect(response).to redirect_to(Wiki.last)
        expect(flash[:notice]).to eq 'Wiki was successfully created.'
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved wiki as @wiki' do
        post :create, { wiki: invalid_attributes }, admin_session
        expect(assigns(:wiki)).to be_a_new(Wiki)
      end

      it "re-renders the 'new' template" do
        post :create, { wiki: invalid_attributes }, admin_session
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT update' do
    let(:wiki) { create :wiki }

    describe 'with valid params' do
      let(:new_attributes) do
        { title: 'New title' }
      end

      it 'updates the requested wiki' do
        expect do
          put :update, { id: wiki.to_param, wiki: new_attributes }, admin_session
        end.to change { wiki.reload.title }.to new_attributes[:title]
      end

      it 'assigns the requested wiki as @wiki' do
        put :update, { id: wiki.to_param, wiki: valid_attributes }, admin_session
        expect(assigns(:wiki)).to eq(wiki)
      end

      it 'redirects to the wiki' do
        put :update, { id: wiki.to_param, wiki: valid_attributes }, admin_session
        expect(response).to redirect_to(wiki)
      end
    end

    describe 'with invalid params' do
      it 'assigns the wiki as @wiki' do
        put :update, { id: wiki.to_param, wiki: invalid_attributes }, admin_session
        expect(assigns(:wiki)).to eq(wiki)
      end

      it "re-renders the 'edit' template" do
        put :update, { id: wiki.to_param, wiki: invalid_attributes }, admin_session
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested wiki' do
      wiki = create(:wiki)
      expect do
        delete :destroy, { id: wiki.to_param }, admin_session
      end.to change(Wiki, :count).by(-1)
    end

    it 'redirects to the wiki list' do
      wiki = create(:wiki)
      delete :destroy, { id: wiki.to_param }, admin_session
      expect(response).to redirect_to(wiki_index_url)
    end
  end

end
