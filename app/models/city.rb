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
class City < ApplicationRecord
  belongs_to :user

  before_create :downcase_name_search

  def downcase_name_search
    self.name_search = self.name_search.downcase
  end

end
