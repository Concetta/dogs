# == Schema Information
#
# Table name: videos
#
#  id           :bigint(8)        not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  image_url    :string           not null
#  published_at :datetime         not null
#  title        :string           not null
#  description  :text
#  youtube_id   :integer          not null
#

require 'rails_helper'

RSpec.describe Video, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
