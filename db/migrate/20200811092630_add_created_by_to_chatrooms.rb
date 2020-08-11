class AddCreatedByToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :created_by , :integer
  end
end
