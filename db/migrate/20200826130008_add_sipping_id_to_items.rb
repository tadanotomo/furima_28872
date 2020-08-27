class AddSippingIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :sipping_id, :integer
  end
end
