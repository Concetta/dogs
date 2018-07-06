class AddDetailToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :image_url, :string,  null: false
    add_column :videos, :published_at, :datetime,  null: false
    add_column :videos, :title, :string,  null: false
    add_column :videos, :description, :text
    add_column :videos, :youtube_id, :integer,  null: false
  end
end
