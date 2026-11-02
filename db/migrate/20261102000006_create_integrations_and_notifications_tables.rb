class CreateIntegrationsAndNotificationsTables < ActiveRecord::Migration[8.0]
  def change
    create_table :integrations do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :provider, null: false
      t.string :status, default: "inactive", null: false
      t.text :encrypted_credentials
      t.jsonb :settings, default: {}

      t.timestamps
    end
    add_index :integrations, [:organization_id, :provider], unique: true

    create_table :webhooks do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :source, null: false
      t.jsonb :payload, default: {}, null: false
      t.string :status, default: "received", null: false

      t.timestamps
    end

    create_table :notifications do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :recipient, null: false, foreign_key: { to_table: :users }
      t.references :actor, foreign_key: { to_table: :users }
      t.references :notifiable, polymorphic: true
      t.string :action, null: false
      t.datetime :read_at

      t.timestamps
    end
    add_index :notifications, [:recipient_id, :read_at]
  end
end
