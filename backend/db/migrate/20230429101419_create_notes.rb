class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :slug
      t.string :eyecatch
      t.text :content
      t.datetime :published_at

      t.timestamps
    end
  end
end
