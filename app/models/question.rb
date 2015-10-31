class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :options
  has_many :chosen_options, :through => :options

  validates :questions, presence: true
end
