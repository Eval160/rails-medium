class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.boolean :publish
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
