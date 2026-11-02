class CreateRecruitmentTables < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :title, null: false
      t.string :department
      t.string :location
      t.string :status, default: "draft", null: false
      t.text :description

      t.timestamps
    end

    create_table :candidates do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone
      t.text :resume_summary

      t.timestamps
    end
    add_index :candidates, [:organization_id, :email], unique: true

    create_table :applications do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.references :candidate, null: false, foreign_key: true
      t.string :stage, default: "applied", null: false

      t.timestamps
    end
    add_index :applications, [:job_id, :candidate_id], unique: true, name: "index_applications_on_job_and_candidate"

    create_table :interviews do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :application, null: false, foreign_key: true
      t.datetime :scheduled_at, null: false
      t.string :location

      t.timestamps
    end

    create_table :interview_feedbacks do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :interview, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :rating, null: false
      t.string :recommendation, null: false
      t.text :notes

      t.timestamps
    end
  end
end
