class CreateSupportTables < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :requester, null: false, foreign_key: { to_table: :users }
      t.references :assignee, foreign_key: { to_table: :users }
      t.string :subject, null: false
      t.string :category, default: "general", null: false
      t.string :priority, default: "normal", null: false
      t.string :status, default: "open", null: false

      t.timestamps
    end
    add_index :tickets, [:organization_id, :status]

    create_table :ticket_comments do |t|
      t.references :ticket, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :body, null: false
      t.boolean :internal_note, default: false, null: false

      t.timestamps
    end

    create_table :ticket_events do |t|
      t.references :ticket, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :action, null: false
      t.jsonb :metadata, default: {}

      t.timestamps
    end
  end
end
