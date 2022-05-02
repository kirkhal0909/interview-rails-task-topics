require './spec/factories/tag_factory'

FactoryBot.define do
  factory :topic do
    title { 'Очень интересная новость' }
    url_path { '/some/path/to/topic' }
    announce { 'Some super attractive announce' }
    text { 'Very <b>hot</b> news that You can see by last some centuries.<br>Here very important information' }

    trait :with_tags do
      tags { build_list :tag, 3, :uniq }
    end
  end
end
