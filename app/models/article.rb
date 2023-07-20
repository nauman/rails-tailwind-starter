class Article < ApplicationRecord
  belongs_to :user

  has_rich_text :body

  validates :title, :body, presence: true
  validates :title, length: { minimum: 5 }

  def self.ransackable_attributes(auth_object = nil)
    %w[body created_at id title updated_at user_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w(rich_text_body user)
  end
end
