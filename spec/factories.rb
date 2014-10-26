FactoryGirl.define do
  sequence :text, aliases: [:description, :keywords] do
    ('A'..'z').to_a.*(10).sample(255).join
  end
  sequence(:name, aliases: [:person]) { |n| "John##{n}" }
  sequence(:email) { |n| "john#{n}@mail.com" }

  factory :user do
    name
    password 'secret'
    password_confirmation { password }
    factory(:guest)   { role 'Role::Guest'   }
    factory(:admin)   { role 'Role::Admin'   }
    factory(:manager) { role 'Role::Manager' }
  end

  factory :wiki do
    title { |n| "Wiki##{n}" }
    text

    association :seo_metadata, strategy: :build
  end

  factory :seo_metadata do
    keywords
    description
  end
end
