class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.integer :user_id
      t.integer :feedback_id

      t.timestamps
    end
  end
end
