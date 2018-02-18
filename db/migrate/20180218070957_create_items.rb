class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :list_id

      t.timestamps
    end
    add_index :items, :list_id
  end
end
