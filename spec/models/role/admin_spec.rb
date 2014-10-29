describe Role::Admin do
  describe '#can?' do
    let(:admin) { described_class.new role: 'Role::Admin' }

    it 'all' do
      expect(admin.can?(:any_controller, :any_action)).to be true
    end
  end
end
