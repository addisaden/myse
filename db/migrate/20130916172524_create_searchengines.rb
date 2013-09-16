class CreateSearchengines < ActiveRecord::Migration
  def change
    create_table :searchengines do |t|
      t.string :name
      t.text :description
      t.string :url
      t.integer :arg_count
      t.boolean :flagged, default: false

      t.timestamps
    end
  end
end
