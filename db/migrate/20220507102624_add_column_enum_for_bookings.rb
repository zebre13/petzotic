class AddColumnEnumForBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :status, :integer, default: 0
  end
end
