# == Schema Information
#
# Table name: cities
#
#  id          :bigint           not null, primary key
#  country     :string
#  icon        :string
#  lat         :float
#  lon         :float
#  name        :string           not null
#  name_search :string           not null
#  region      :string
#  temp_c      :float
#  temp_f      :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tz_id       :string
#
# Indexes
#
#  index_cities_on_name         (name) UNIQUE
#  index_cities_on_name_search  (name_search) UNIQUE
#
class City < ApplicationRecord
  has_and_belongs_to_many :users

  validates :country, :icon, :lat, :lon,  :name, :region, :temp_c, :temp_f, :tz_id, presence: true

  before_create :downcase_name_search

  def downcase_name_search
    self.name_search = self.name_search.downcase
  end
end
