require 'rails_helper'

describe Movie, type: :model do
  subject { Movie.new(title: "Here is the content") }
  # it { should validate_uniqueness_of(:title) }
  it { should validate_presence_of(:title) }
end
