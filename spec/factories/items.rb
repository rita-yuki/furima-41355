FactoryBot.define do
  factory :item do
    title { 'テストアイテム' }
    description { 'テストアイテムの説明' }
    category_id { 2 }  
    product_status_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    days_up_to_delivery_id { 2 }
    price { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec/fixtures/files/test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end
end
