class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :syntax
      t.text :issue_body
      t.text :code_body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
