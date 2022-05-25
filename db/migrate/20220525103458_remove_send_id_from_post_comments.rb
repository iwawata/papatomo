class RemoveSendIdFromPostComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :post_comments, :send_id
  end
end
