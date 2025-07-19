require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'users query' do
    it 'returns all users' do
      user1 = User.create!(name: 'Test User 1', email: 'test1@example.com')
      user2 = User.create!(name: 'Test User 2', email: 'test2@example.com')

      query = <<~GQL
        query {
          users {
            id
            name
            email
          }
        }
      GQL

      result = FarmyApiSchema.execute(query)

      expect(result['errors']).to be_nil
      expect(result['data']['users'].length).to eq(2)

      user_ids = result['data']['users'].map { |user| user['id'] }
      expect(user_ids).to include(user1.id.to_s, user2.id.to_s)
    end
  end

  describe 'user query' do
    it 'returns a specific user' do
      user = User.create!(name: 'Test User', email: 'test@example.com')

      query = <<~GQL
        query($id: ID!) {
          user(id: $id) {
            id
            name
            email
          }
        }
      GQL

      result = FarmyApiSchema.execute(query, variables: { id: user.id })

      expect(result['errors']).to be_nil
      expect(result['data']['user']['id']).to eq(user.id.to_s)
      expect(result['data']['user']['name']).to eq('Test User')
      expect(result['data']['user']['email']).to eq('test@example.com')
    end

    it 'returns nil for non-existent user' do
      query = <<~GQL
        query($id: ID!) {
          user(id: $id) {
            id
            name
            email
          }
        }
      GQL

      result = FarmyApiSchema.execute(query, variables: { id: '999999' })

      expect(result['errors']).to be_nil
      expect(result['data']['user']).to be_nil
    end
  end
end
