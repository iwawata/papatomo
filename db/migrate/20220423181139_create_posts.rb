class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.integer :end_user_id, null: false
      t.integer :genres_id, null: false
      t.text :caption, null: false
      t.integer :caption_image_id

      t.timestamps
    end
  end
end
