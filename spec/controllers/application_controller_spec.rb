describe ApplicationController do
  describe '#authorize' do
    before do
      described_class.class_eval do
        def index
          head :ok
        end
      end
      Rails.application.routes.append { get :index, to: 'application#index' }
      Rails.application.routes_reloader.reload!
    end

    context 'if have permissions' do
      let(:admin) { create :admin }
      let(:admin_session) { { user_id: admin.id } }

      it 'must head success' do
        get :index, {}, admin_session
        expect(response).to be_success
      end
    end

    context 'if no have permissions' do
      it 'must redirect to root' do
        get :index
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq 'You no have permissions to do this.'
      end
    end
  end
end
