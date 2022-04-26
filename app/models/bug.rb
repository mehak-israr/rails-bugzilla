class Bug < ApplicationRecord
  belongs_to :project
  validates :title, presence: true, uniqueness: true
end
