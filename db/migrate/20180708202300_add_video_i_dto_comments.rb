class AddVideoIDtoComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :video_id, :integer,  null: false
  end
end
