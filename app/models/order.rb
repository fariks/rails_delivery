class Order < ApplicationRecord
  belongs_to :load
  #belongs_to :origin_address_id, class_name: 'Address'
  #belongs_to :destination_address_id, class_name: 'Address'
end
