require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it 'is valid with all required fields (first name, last name, email, password, password_confirmation)' do
      user = User.new(
        first_name: "First",
        last_name: "Last",
        password: 'password123',
        password_confirmation: 'password123',
        email: 'test@test.com'
      )
      expect(user).to be_valid
    end

    it 'is not valid if password and password_confirmation fields do not match' do
      user = User.new(
        first_name: "First",
        last_name: "Last",
        password: 'password123',
        password_confirmation: 'password456',
        email: 'test@test.com'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq(["Password confirmation doesn't match Password"])
    end

    it 'is not valid if password field is nil' do
      user = User.new(
        first_name: "First",
        last_name: "Last",
        password: nil,
        password_confirmation: 'password456',
        email: 'test@test.com'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq(["Password can't be blank", "Password is too short (minimum is 6 characters)"])
    end

    it 'is not valid if password_confirmation field is nil' do
      user = User.new(
        first_name: "First",
        last_name: "Last",
        password: 'password123',
        password_confirmation: nil,
        email: 'test@test.com'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq(["Password confirmation can't be blank"])
    end

    it 'is not valid if password is below the minimum length (6 characters)' do
      user = User.new(
        first_name: "First",
        last_name: "Last",
        password: 'pass1',
        password_confirmation: 'pass1',
        email: 'test@test.com'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to eq(["Password is too short (minimum is 6 characters)"])
    end

    it 'is not valid if email is not unique (case-insensitive)' do
      User.create(email: 'test@test.COM', password: 'password123', password_confirmation: 'password123', first_name: "First", last_name: "Last")
      user = User.new(email: 'TEST@TEST.com', password: 'password456', password_confirmation: 'password456', first_name: "First", last_name: "Last")
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include('Email has already been taken')
    end

    it 'is not valid if first_name field is nil' do
      user = User.new(
        first_name: nil,
        last_name: "Last",
        password: 'password456',
        password_confirmation: 'password456',
        email: 'test@test.com'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is not valid if last_name field is nil' do
      user = User.new(
        first_name: "First",
        last_name: nil,
        password: 'password456',
        password_confirmation: 'password456',
        email: 'test@test.com'
      )
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do
        it 'is authenticated successfully if user types a few spaces before/after their email address' do
      user = User.create(email: 'example@domain.com', password: 'password123', password_confirmation: 'password123', first_name: "First", last_name: "Last")
      authenticated_user = User.authenticate_with_credentials(' example@domain.com ', 'password123')
      expect(authenticated_user).to eq(user)
    end

    it 'is authenticated successfully if user types in the wrong case for their email address' do
      user = User.create(email: 'eXample@domain.COM', password: 'password123', password_confirmation: 'password123', first_name: "First", last_name: "Last")
      user = User.authenticate_with_credentials('EXAMPLe@DOMAIN.CoM', 'password123')
      expect(user).not_to be(nil)
    end
  end  
end