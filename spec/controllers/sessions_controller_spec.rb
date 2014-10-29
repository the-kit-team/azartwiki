describe SessionsController do
  describe 'GET #new' do
    it 'must render template new' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let(:user) { create :admin }

    context 'with good params' do
      it 'must create session' do
        post :create, login: user.name, password: user.password
        expect(session['user_id']).to eq(user.id)
      end
    end

    context 'with bad params' do
      it 'must create session' do
        post :create, login: 'wrong', password: user.password
        expect(response).to redirect_to login_path
        expect(flash[:alert]).to eq 'Invalid user/password combination'
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:manager) { create :manager }
    before { login_as manager }

    it 'must remove session' do
      delete :destroy
      expect(session['user_id']).to be_nil
      expect(response).to redirect_to root_path
      expect(flash[:notice]).to eq 'Logged out'
    end
  end
end
