class CreateCityUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :cities_users do |t|
      t.belongs_to :city, null: false
      t.belongs_to :user, null: false
      t.timestamps
    end
  end
end
