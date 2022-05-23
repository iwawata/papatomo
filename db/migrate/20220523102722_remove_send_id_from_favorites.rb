class RemoveSendIdFromFavorites < ActiveRecord::Migration[6.1]
  def change
    remove_column :favorites, :send_id
  end
end
