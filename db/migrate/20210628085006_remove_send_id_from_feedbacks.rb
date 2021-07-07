class RemoveSendIdFromFeedbacks < ActiveRecord::Migration[6.1]
  def change
    remove_column :feedbacks, :send_id, :integer
  end
end
