class AddDetailsToAlohas < ActiveRecord::Migration[6.1]
  def change
    add_column :alohas, :lat, :float
    add_column :alohas, :lng, :float
  end
end
