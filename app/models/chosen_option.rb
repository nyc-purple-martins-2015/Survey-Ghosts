class ChosenOption < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  belongs_to :option
  has_one :question, :through => :option
end
