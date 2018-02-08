class AddDefaultToDraftFieldOnArticles < ActiveRecord::Migration[5.1]
  def up
    change_column :articles, :draft, :boolean, default: true
  end

  def down
    change_column :articles, :draft, :boolean, default: nil
  end
end
