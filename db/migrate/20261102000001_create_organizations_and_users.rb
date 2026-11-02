class CreateOrganizationsAndUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.jsonb :settings, default: {}

      t.timestamps
    end
    add_index :organizations, :slug, unique: true

    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.timestamps
    end
    add_index :users, :email, unique: true

    create_table :memberships do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :role, null: false, default: 3 # 0: owner, 1: admin, 2: manager, 3: member, 4: reader

      t.timestamps
    end
    add_index :memberships, [:organization_id, :user_id], unique: true

    create_table :invitations do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :email, null: false
      t.integer :role, null: false, default: 3
      t.string :token, null: false
      t.datetime :expires_at, null: false
      t.references :invited_by, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :invitations, :token, unique: true
  end
end
