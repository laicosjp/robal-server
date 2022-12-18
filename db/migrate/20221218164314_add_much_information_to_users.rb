class AddMuchInformationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :position, :string
    add_column :users, :bio,      :text
    add_column :users, :country,  :string  # 日本
    add_column :users, :city,     :string  # 神奈川県横浜市
  end
end
