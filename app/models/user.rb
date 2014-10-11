class User < ActiveRecord::Base
  self.inheritance_column = 'role'

  enum role: {
    admin:   'Role::Admin',
    manager: 'Role::Manager',
    guest:   'Role::Guest'
  }

  has_secure_password

  validates :name, :role, presence: true
end
