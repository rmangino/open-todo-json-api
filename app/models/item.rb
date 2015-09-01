class Item < ActiveRecord::Base
  belongs_to :list
  validates :title, presence: true
  validates_inclusion_of :complete, in: [true, false]
end
