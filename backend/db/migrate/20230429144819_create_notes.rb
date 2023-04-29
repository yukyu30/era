class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.string :slug, null: false, unique: true
      t.string :eyecatch
      t.text :content, null: false
      t.datetime :published_at

      t.timestamps
    end

    add_index :notes, :slug, unique: true
  end
end
