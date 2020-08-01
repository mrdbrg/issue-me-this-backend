class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :key
      t.string :text
      t.string :value
      t.string :color

      t.timestamps
    end
  end
end
