class SeoMetadata < ActiveRecord::Base
  belongs_to :wiki

  validates :keywords, :description, presence: true
end
