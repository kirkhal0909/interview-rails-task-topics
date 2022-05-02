require 'rails_helper'
require './spec/factories/topic_factory'

RSpec.describe Tag, type: :model do
  describe 'generate slug' do
    let(:topic) { FactoryBot.create(:topic, title: 'Супер новость') }

    it 'after create' do
      expect(topic.slug).to eq("#{topic.id}-super-novost")
    end

    it 'after update' do
      topic.update(title: 'Модифицированная супер новость!')
      expect(topic.slug).to eq("#{topic.id}-modifitsirovannaya-super-novost")
    end
  end
end
