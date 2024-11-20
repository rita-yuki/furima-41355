class CreateDaysUpToDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :days_up_to_deliveries do |t|

      t.timestamps
    end
  end
end
