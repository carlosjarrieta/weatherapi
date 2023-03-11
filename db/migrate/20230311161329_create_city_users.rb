class CreateCityUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :city_users do |t|
      t.references :city, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
