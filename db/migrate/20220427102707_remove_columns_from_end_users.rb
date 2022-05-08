class RemoveColumnsFromEndUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :end_users, :name, :string
    remove_column :end_users, :name_kana, :string
  end
end
