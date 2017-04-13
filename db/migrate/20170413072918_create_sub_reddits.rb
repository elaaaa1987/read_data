class CreateSubReddits < ActiveRecord::Migration
  def change
    create_table :sub_reddits do |t|
      t.string :politics_code
      t.text :description
      t.string :banner_image
      t.text :response_data

      t.timestamps null: false
    end
  end
end
