class Order < ApplicationRecord
  has_one :delivery, dependent: :destroy
  accepts_nested_attributes_for :delivery
end
