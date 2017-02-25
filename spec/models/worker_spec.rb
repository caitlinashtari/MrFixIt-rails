require 'rails_helper'

RSpec.describe Worker, type: :model do
  it { should have_many :jobs }
end
