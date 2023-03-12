# == Schema Information
#
# Table name: city_users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_city_users_on_city_id  (city_id)
#  index_city_users_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class CityUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
