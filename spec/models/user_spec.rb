require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @attr = { :first_name => "John",
              :last_name => "Smith",
              :email => "test@test.com",
              :password => "secret"
              #:password_confirmation => "secret"
            }
  end

  describe 'Validation' do
    it "should require a matching password confirmation" do
      user = User.new(@attr.merge(:password_confirmation => "invalid"))
      expect(user).not_to be_valid
    end
    it "should be case-insensitive with email" do
      user1 = User.create(@attr)
      user2 = User.new(@attr.merge(:email => "TEST@test.com"))
      expect(user2).not_to be_valid
    end
    it 'should have first_name' do
      user = User.create
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'should have last_name' do
      user = User.create
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'should have eamil' do
      user = User.create
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "should more than 5 passwords" do
      user = User.new(@attr.merge(:password => "1234"))
      expect(user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it ''
  end
end
