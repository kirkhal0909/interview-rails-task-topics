FactoryBot.define do
  factory :tag do
    tag_name = 'Computer Science'
    name { tag_name }

    trait :uniq do
      sequence(:name) { |n| "#{tag_name} #{n}" }
    end
  end
end
