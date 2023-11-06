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
  end
end