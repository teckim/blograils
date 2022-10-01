require 'swagger_helper'

RSpec.describe 'Users Posts API', type: :request do
  path '/api/users/{user_id}/posts' do
    get 'Retrieves user posts' do
      tags 'User Posts'
      security [basic_auth: []]
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string

      response '200', 'name found' do
        schema type: :array,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 text: { type: :string },
                 author_id: { type: :integer }
               },
               required: %w[id title text]

        let(:Authorization) do
          'Basic eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3LCJleHAiOjE2NjQ3MjIxODV9.b5ztIQguwMv1BVbdNhu8pcTfsRJDN1l4MC1RWfuPSu8'
        end
        let(:user_id) { User.first.id }
        run_test!
      end
    end
  end
end
