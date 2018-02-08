class AddDraftToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :draft, :boolean
  end
end
