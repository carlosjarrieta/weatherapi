# == Schema Information
#
# Table name: cities_users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_cities_users_on_city_id  (city_id)
#  index_cities_users_on_user_id  (user_id)
#
class CitiesUser < ApplicationRecord
  include Notificable
  belongs_to :city
  belongs_to :user

  validates :user_id, :city_id, presence: true

  scope :all_except, ->(_user_id) { where.not(user_id: _user_id) }
end
