require 'rails_helper'
require './spec/factories/tag_factory'

RSpec.describe Tag, type: :model do
  describe 'generate slug' do
    let(:tag) { FactoryBot.create(:tag, name: 'movies and actors') }

    it 'after create' do
      expect(tag.slug).to eq('movies-and-actors')
    end

    it 'after update' do
      tag.update(name: 'Computer Science')
      expect(tag.slug).to eq('computer-science')
    end
  end
end
