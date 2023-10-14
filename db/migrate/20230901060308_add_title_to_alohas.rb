class AddTitleToAlohas < ActiveRecord::Migration[6.1]
  def change
    add_column :alohas, :photo, :string
  end
end
