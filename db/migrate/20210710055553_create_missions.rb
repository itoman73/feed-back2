class CreateMissions < ActiveRecord::Migration[6.1]
  def change
    create_table :missions do |t|
      t.string :mission
      t.integer :user_id

      t.timestamps
    end
  end
end
