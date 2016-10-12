class Load < ApplicationRecord
  has_many :orders
  belongs_to :driver
end
