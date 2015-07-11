class House < ActiveRecord::Base
  belongs_to :human
  validates :human, presence: true
end
