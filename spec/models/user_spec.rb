require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with password and password_confirmation fields' do
      user = User.new(
        password: 'password123',
        password_confirmation: 'password123'
      )
      expect(user).to be_valid
    end

    it 'is not valid if password and password_confirmation fields do not match' do
      user = User.new(
        password: 'password123',
        password_confirmation: 'password456'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq(["Password confirmation doesn't match Password"])
    end

    it 'is not valid if password field is nil' do
      user = User.new(
        password: nil,
        password_confirmation: 'password456'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq(["Password can't be blank"])
    end
  end
end