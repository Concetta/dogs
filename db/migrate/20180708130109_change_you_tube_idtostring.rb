class ChangeYouTubeIdtostring < ActiveRecord::Migration[5.1]
  def change
    change_column :videos, :youtube_id, :string
  end
end
