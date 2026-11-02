class CreateKnowledgeBaseTables < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description

      t.timestamps
    end
    add_index :categories, [:organization_id, :slug], unique: true

    create_table :articles do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :title, null: false
      t.string :slug, null: false
      t.string :status, default: "draft", null: false

      t.timestamps
    end
    add_index :articles, [:organization_id, :slug], unique: true

    create_table :article_revisions do |t|
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :content_snapshot
      t.integer :version, null: false

      t.timestamps
    end
  end
end
