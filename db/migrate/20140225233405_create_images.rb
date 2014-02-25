class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image
      t.boolean :image_processing
      t.references :owner, polymorphic: true

      t.timestamps
    end
  end
end
