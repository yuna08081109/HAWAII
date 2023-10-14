class AddPhoneNumberToAlohas < ActiveRecord::Migration[6.1]
  def change
    add_column :alohas, :phonenumber, :string
  end
end
