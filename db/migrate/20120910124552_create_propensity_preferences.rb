class CreatePropensityPreferences < ActiveRecord::Migration
  def change
    create_table :propensity_preferences do |t|
      t.string :name
      t.integer :owner_id
      t.string :owner_type
      t.text :value
      t.string :key
      t.string :value_type
      t.timestamps
    end

    add_index :propensity_preferences, :key, :unique => true
  end
end
