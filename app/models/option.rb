class Option < ActiveRecord::Base
  belongs_to :question
  has_many :chosen_options
end
