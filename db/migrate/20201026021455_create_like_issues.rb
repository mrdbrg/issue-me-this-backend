class CreateLikeIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :like_issues do |t|
      t.boolean :is_like
      t.references :issue, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
