FactoryGirl.define do
  factory :user do
    name 'Eva'
    surname 'Modra'
    email 'eva@modra.com'
    password 'eva'
  end
  
  factory :skill do
    name 'make origami'
  end
end