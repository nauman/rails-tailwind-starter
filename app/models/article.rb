# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
class Article < ApplicationRecord
  extend FriendlyId
  belongs_to :user

  has_rich_text :body
  friendly_id :title, use: :slugged

  validates :title, :body, presence: true
  validates :title, length: { minimum: 5 }

  def self.ransackable_attributes(auth_object = nil)
    %w[body created_at id title updated_at user_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w(rich_text_body user)
  end
end
