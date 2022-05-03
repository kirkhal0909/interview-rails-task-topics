require 'swagger_helper'

RSpec.describe 'api', type: :request do

  path '/api/tags' do

    get('Получить список тэгов') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/topics' do

    get('Получить список постов') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/topic/{url_path}/{slug}' do
    # You'll want to customize the parameter types...
    parameter name: 'url_path', in: :path, type: :string, description: 'url_path'
    parameter name: 'slug', in: :path, type: :string, description: 'slug'

    get('Получить страницу поста в html формате') do
      response(200, 'successful') do
        let(:url_path) { 'hard/part/here' }
        let(:slug) { '301-the-force-is-strong-with-him-the-son-of-skywalker-must-not-become-a-jedi' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/html' => {
              example: response.body
            }
          }
        end
        run_test!
      end
    end
  end
end
