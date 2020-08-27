class AddSippingdateIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :sipping_date_id, :integer
  end
end
