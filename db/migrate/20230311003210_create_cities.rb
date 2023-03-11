class CreateCities < ActiveRecord::Migration[7.0]

  def change
    create_table :cities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name_search, null: false, index: {unique: true}
      t.string :name, null: false, index: {unique: true}
      t.string :region
      t.string :country
      t.float :lat
      t.float :lon
      t.string :tz_id
      t.datetime :localtime
      t.float :temp_c
      t.float :temp_f
      t.string :icon

      t.timestamps
    end
  end
end
