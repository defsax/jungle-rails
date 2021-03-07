require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should create a valid user" do
      user = User.create(
        first_name: "Per",
        last_name: "Per",
        email: "123@123.com",
        password: "123",
        password_confirmation: "123"
      )
      expect(user).to (be_valid)
    end

    it "should fail without either password or password_confirmation" do
      user1 = User.create(
        first_name: "Per",
        last_name: "Per",
        email: "123@123.com",
        password: "123"
      )
      user2 = User.create(
        first_name: "Per",
        last_name: "Per",
        email: "123@123.com",
        password_confirmation: "123"
      )
      expect(user1).to_not (be_valid)
      expect(user2).to_not (be_valid)
    end

    it "should make sure passwords match" do
      user = User.create(
        first_name: "Per",
        last_name: "Per",
        email: "123@123.com",
        password: "123",
        password_confirmation: "1234"
      )
      expect(user).to_not (be_valid)
    end

    it "should check email for uniqueness" do
      user1 = User.create(
        first_name: "Per",
        last_name: "Per",
        email: "123@123.com",
        password: "123",
        password_confirmation: "123"
      )
      user2 = User.create(
        first_name: "Per",
        last_name: "Per",
        email: "123@123.com",
        password: "123",
        password_confirmation: "123"
      )
      expect(user2).to_not (be_valid)
    end

    it "should check password length" do
      user = User.create(
        first_name: "Per",
        last_name: "Per",
        email: "123@123.com",
        password: "12",
        password_confirmation: "12"
      )
      expect(user).to_not (be_valid)
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate using class method' do
      user = User.create(
        first_name: "Per",
        last_name: "Per",
        email: "  1234@1234.com",
        password: "4321",
        password_confirmation: "4321"
      )

      authenticate = User.authenticate_with_credentials(user.email, user.password)
      expect(authenticate).to be_truthy
    end
  end
end
