class Wiki < ActiveRecord::Base
  include Bootsy::Container
  has_one :seo_metadata, dependent: :delete
  accepts_nested_attributes_for :seo_metadata, allow_destroy: true

  validates_associated :seo_metadata
  validates :title, :text, presence: true
end
