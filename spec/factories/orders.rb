FactoryBot.define do
  factory :order do
    customer_name { "MyString" }
    delivery { nil }
    joureny_time { 1 }
    delivery_due { "2021-09-12 23:25:42" }
  end
end
