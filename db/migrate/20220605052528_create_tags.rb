class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|

      t.timestamps

      t.string :name
      t.integer :post_id
    end
  end
end
