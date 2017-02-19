FactoryGirl.define do
  factory :user do
    username "Pekka"
    password "Foobar1"
    password_confirmation "Foobar1"
  end

  factory :brewery do
    name "Koff"
    year 1900
  end

  factory :style do
    name "Lager"
    description "the best lager"
  end

  factory :style2, class: Style do
    name "IPA"
    description "the worst IPA"
  end

  factory :beer do
    name "anonymousbeer"
    brewery
    style_id 1
  end

  factory :rating do
    score 10
  end

  factory :rating2, class: Rating do
    score 30
  end
end
