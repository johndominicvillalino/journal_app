class AddUserIdToCategories < ActiveRecord::Migration[7.0]
  def change
    # add_column :categories, :user_id, :integer
    add_reference :categories, :user, foreign_key: true
  end
end
