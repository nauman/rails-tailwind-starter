class AddSlugToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :slug, :string
  end
end
