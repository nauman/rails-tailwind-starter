# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text
#  slug       :string
#  title      :string
#  uuid       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
  extend FriendlyId
  belongs_to :user

  before_save :generate_uuid, if: -> { uuid.nil? }    # Generate a random UUID for the uuid field

  has_rich_text :body
  friendly_id :generate_slug, use: :slugged

  validates :title, :body, presence: true
  validates :title, length: { minimum: 5 }

  def self.ransackable_attributes(auth_object = nil)
    %w[body created_at id title updated_at user_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w(rich_text_body user)
  end

  # Generate a random ID for the slug
  def generate_slug
    "#{title} #{uuid}"
  end

  def should_generate_new_friendly_id?
    title_changed? || uuid_changed? || super
  end

  def generate_uuid
    self.uuid = SecureRandom.hex(5)
  end
end
