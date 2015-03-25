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
    trait :make_origami      do name 'make origami' end
    trait :make_glass        do name 'make glass' end
    trait :draw_pictures     do name 'draw pictures' end
    trait :teach_english     do name 'teach English' end
    trait :teach_spanish     do name 'teach Spanish' end
    trait :learn_english     do name 'learn English' end
    trait :learn_spanish     do name 'learn Spanish' end
    trait :cut_wood          do name 'cut wood' end
    trait :work_with_animals do name 'work with animals' end
  end
end