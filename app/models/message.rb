# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  author_id  :integer          not null
#  channel_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord
  validates :body, :author_id, :channel_id, presence: true

  belongs_to :channel
  belongs_to :author, 
    class_name: :User
  
end
