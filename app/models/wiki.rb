class Wiki < ActiveRecord::Base
  validates :title, :text, presence: true
end
