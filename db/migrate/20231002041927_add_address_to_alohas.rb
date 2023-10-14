class AddAddressToAlohas < ActiveRecord::Migration[6.1]
  def change
    add_column :alohas, :address, :text
  end
end
