# == Schema Information
#
# Table name: cities
#
#  id          :bigint           not null, primary key
#  country     :string
#  icon        :string
#  lat         :float
#  localtime   :datetime
#  lon         :float
#  name        :string           not null
#  name_search :string           not null
#  region      :string
#  temp_c      :float
#  temp_f      :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tz_id       :string
#  user_id     :bigint           not null
#
# Indexes
#
#  index_cities_on_name         (name) UNIQUE
#  index_cities_on_name_search  (name_search) UNIQUE
#  index_cities_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
