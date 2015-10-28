class AddLinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :link, :string
    add_column :users, :location, :string
    add_column :users, :locale, :string
  end
end
