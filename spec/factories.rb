FactoryGirl.define do
  factory :user do
    name 'Johnny'
    surname 'Mnemonic'
    email 'johnny@mnemonic.com'
    password 'johnny'
  end
  
  factory :adam, class: User do
    name 'Adam'
    surname 'Durak'
    email 'adam@durak.com'
    password 'adam'
  end
  
  factory :eva, class: User do
    name 'Eva'
    surname 'Modra'
    email 'eva@modra.com'
    password 'eva'
  end
  
  factory :skill do
    name 'make origami'
  end
end