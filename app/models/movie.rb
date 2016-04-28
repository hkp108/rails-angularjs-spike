class Movie < ActiveRecord::Base
  validates :title, uniqueness: false, presence: true
end
