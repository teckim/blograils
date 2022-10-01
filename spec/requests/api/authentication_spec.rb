require 'swagger_helper'

RSpec.describe 'Auth API', type: :request do
  path '/api/auth/login' do
    post('User login') do
      tags 'Auth'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :auth, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }

      response(200, 'successful') do
        let(:auth) { { email: 'hakim.bhd@gmail.com', password: '123456789' } }

        run_test!
      end
    end
  end
end
