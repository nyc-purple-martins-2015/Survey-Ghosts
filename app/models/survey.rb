class Survey < ActiveRecord::Base
  belongs_to :author, :class_name => "user"
  has_many :questions
  has_many :chosen_options

  validates :title, presence: true
end
