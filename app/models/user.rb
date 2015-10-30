class User < ActiveRecord::Base
  has_many :surveys, :foreign_key => :author_id
  has_many :chosen_options
  has_many :options, :through => :chosen_options

  validates :username, presence: true, uniqueness: true

  has_secure_password
end

