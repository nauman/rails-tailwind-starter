class AddUuidToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :uuid, :string
  end
end
