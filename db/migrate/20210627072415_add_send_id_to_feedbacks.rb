class AddSendIdToFeedbacks < ActiveRecord::Migration[6.1]
  def change
    add_column :feedbacks, :send_id, :integer
  end
end
