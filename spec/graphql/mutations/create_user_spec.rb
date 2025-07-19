require 'rails_helper'

RSpec.describe Mutations::CreateUser do
  describe 'resolve' do
    it 'creates a new user with valid attributes' do
      mutation = <<~GQL
        mutation($input: CreateUserInput!) {
          createUser(input: $input) {
            user {
              id
              name
              email
            }
            errors
            clientMutationId
          }
        }
      GQL

      result = FarmyApiSchema.execute(
        mutation,
        variables: {
          input: {
            name: 'Test User',
            email: 'test@example.com',
            clientMutationId: 'test-mutation-1'
          }
        }
      )

      expect(result['errors']).to be_nil
      expect(result['data']['createUser']['errors']).to be_empty
      expect(result['data']['createUser']['user']['name']).to eq('Test User')
      expect(result['data']['createUser']['user']['email']).to eq('test@example.com')
      expect(result['data']['createUser']['clientMutationId']).to eq('test-mutation-1')

      # Verify user was actually created in database
      user = User.find(result['data']['createUser']['user']['id'])
      expect(user.name).to eq('Test User')
      expect(user.email).to eq('test@example.com')
    end

    it 'creates a user with minimal attributes' do
      mutation = <<~GQL
        mutation($input: CreateUserInput!) {
          createUser(input: $input) {
            user {
              id
              name
              email
            }
            errors
            clientMutationId
          }
        }
      GQL

      result = FarmyApiSchema.execute(mutation, variables: { input: {} })

      expect(result['errors']).to be_nil
      expect(result['data']['createUser']['errors']).to be_empty
      expect(result['data']['createUser']['user']['id']).to be_present
      expect(result['data']['createUser']['user']['name']).to be_nil
      expect(result['data']['createUser']['user']['email']).to be_nil
    end
  end
end
