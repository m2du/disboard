# == Schema Information
#
# Table name: channels
#
#  id         :bigint           not null, primary key
#  guild_id   :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  private    :boolean          default(FALSE)
#

require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
