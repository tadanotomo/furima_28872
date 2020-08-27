class AddSippingOriginIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :sipping_origin_id, :integer
  end
end
