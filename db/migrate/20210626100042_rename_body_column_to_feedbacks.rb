class RenameBodyColumnToFeedbacks < ActiveRecord::Migration[6.1]
  def change
    rename_column :feedbacks, :body, :assist
  end
end
