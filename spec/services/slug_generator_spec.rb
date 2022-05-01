require 'rails_helper'

RSpec.describe SlugGenerator, type: :service do
  describe '#call' do
    context 'when slug generated' do
      it 'replace spaces to dashes' do
        string = '  string with   spaces '
        expect(described_class.call(string)).to eq('string-with-spaces')
      end

      it 'save digits' do
        string = '5tring and 1337 numb3r5'
        expect(described_class.call(string)).to eq('5tring-and-1337-numb3r5')
      end

      it 'remove special symbols' do
        string = 'string with special!@# $%^&()-symbols'
        expect(described_class.call(string)).to eq('string-with-special-symbols')
      end

      it 'support cyrillic symbols' do
        string = 'строка, в которой есть символы кириллицы'
        expect(described_class.call(string)).to eq('строка-в-которой-есть-символы-кириллицы')
      end

      it 'apply lowercase' do
        string = 'СтРоКа с UpPeRCaSe AnD LoWeRcAsE'
        expect(described_class.call(string)).to eq('строка-с-uppercase-and-lowercase')
      end
    end
  end
end
