class CreateCrmTables < ActiveRecord::Migration[8.0]
  def change
    create_table :companies do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :name, null: false
      t.string :domain
      t.string :industry
      t.string :status, default: "active"
      t.references :assigned_to, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :companies, [:organization_id, :name]

    create_table :contacts do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :company, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone
      t.string :title

      t.timestamps
    end
    add_index :contacts, [:organization_id, :email]

    create_table :deals do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :company, foreign_key: true
      t.string :name, null: false
      t.string :stage, default: "lead", null: false
      t.decimal :amount, precision: 12, scale: 2, default: 0.0
      t.date :close_date
      t.references :assigned_to, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :deals, [:organization_id, :stage]

    create_table :activities do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :trackable, polymorphic: true, null: false
      t.string :activity_type, null: false # note, call, email, meeting
      t.string :subject, null: false
      t.text :body

      t.timestamps
    end

    create_table :tasks do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :assignee, null: false, foreign_key: { to_table: :users }
      t.string :subject, null: false
      t.text :description
      t.date :due_date
      t.string :priority, default: "medium"
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
