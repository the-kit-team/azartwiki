describe Role::Base do
  describe '#model_name' do
    it { expect(described_class.model_name).to eq ActiveModel::Name.new(User) }
  end

  describe '#can?' do
    { guest: { controller: :home, action: :index },
      admin: { controller: :user, action: :create },
      manager: { controller: :home, action: :index }
    }.each do |role, permit|
      it "#{role} #{permit[:controller]} #{permit[:action]}" do
        user = "Role::#{role.capitalize}".constantize.new
        expect(user.can?(permit[:controller], permit[:action])).to be true
      end
    end
  end

  describe '#can_do?' do
    it { expect(described_class.new.send :can_do?).to eq false }
  end
end
