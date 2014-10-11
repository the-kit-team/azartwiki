describe User do
  subject(:user) { build :user }

  it { is_expected.to be_valid }

  it { is_expected.to have_secure_password }

  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:role).of_type(:string) }
  it { is_expected.to have_db_column(:password_digest).of_type(:string) }

  it 'must have enum role' do
    expect(described_class.roles).to match(
      'admin'   => 'Role::Admin',
      'manager' => 'Role::Manager',
      'guest'   => 'Role::Guest'
    )
  end

  describe 'must be STI model' do
    described_class.roles.each_value do |role_class_name|
      it { expect(described_class.new role: role_class_name).to be_a(role_class_name.constantize) }
    end
  end

  describe 'self.model_name' do
    it { expect(described_class.model_name).to eq ActiveModel::Name.new(described_class) }
  end
end
