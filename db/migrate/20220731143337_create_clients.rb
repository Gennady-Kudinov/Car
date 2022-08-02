class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :number_auto, index: true
      t.string :brand_auto
      t.string :model_auto
      t.integer :km
      t.string :vin
      t.text :deffect
      t.string :swid
      t.string :phone
      t.integer :price
      t.date :data

      t.timestamps
    end
  end
end
