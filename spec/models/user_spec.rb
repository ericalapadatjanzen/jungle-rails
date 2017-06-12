require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be true if password, password_confirmation, first_name, last_name, email are present' do
      user = User.new(password: "1234567", password_confirmation: "1234567", first_name: "bob", last_name: "Boberson", email: "bob@bob.com")
      expect(user).to(be_valid)
    end
     it 'should be false if password and password_confirmation are not the same' do
      user = User.new(password: "1234567", password_confirmation: "0987654321", first_name: "bob", last_name: "Boberson", email: "bob@bob.com")
      expect(user).to_not(be_valid)
    end
      it 'should be false if password is not present' do
      user = User.new(password_confirmation: "1234567", first_name: "bob", last_name: "Boberson", email: "bob@bob.com")
      expect(user).to_not(be_valid)
    end
    it 'should be false if password_confirmation not present' do
      user = User.new(password: "1234567", first_name: "bob", last_name: "Boberson", email: "bob@bob.com")
      expect(user).to_not(be_valid)
    end
    it 'should be false if first_name not present' do
      user = User.new(password: "1234567", password_confirmation: "1234567", last_name: "Boberson", email: "bob@bob.com")
      expect(user).to_not(be_valid)
    end
    it 'should be false if last_name not present' do
      user = User.new(password: "1234567", password_confirmation: "1234567", first_name: "bob", email: "bob@bob.com")
      expect(user).to_not(be_valid)
    end
      it 'should be false if email not present' do
      user = User.new(password: "1234567", password_confirmation: "1234567", first_name: "bob", last_name: "Boberson")
      expect(user).to_not(be_valid)
    end
      it 'should be false if email is not unique(also not case sensitive)' do
      user = User.new(password: "1234567", password_confirmation: "1234567", first_name: "bob",last_name: "Boberson", email: "bob@bob.com")
      user.save
      user1 = User.new(password: "1234567", password_confirmation: "1234567", first_name: "bob", last_name: "Boberson", email: "bob@bob.com")
      expect(user1).to_not(be_valid)
    end
      it 'should be false if email is not unique also not case sensitive' do
      user = User.new(password: "1234567", password_confirmation: "1234567", first_name: "bob",last_name: "Boberson", email: "bob@bob.com")
      user.save
      user1 = User.new(password: "1234567", password_confirmation: "1234567", first_name: "bob", last_name: "Boberson", email: "BOB@bob.com")
      expect(user1).to_not(be_valid)
    end
      it 'should be false if password is not at least 6 characters' do
      user = User.new(password: "bob", password_confirmation: "bob", first_name: "bob", last_name: "Boberson", email: "bob@bob.com")
      expect(user).to_not(be_valid)
    end

    describe '.authenticate_with_credentials' do
      it 'should get the right user if email and password match params' do
        actual_user = User.create(password: "1234567", password_confirmation: "1234567", first_name: "bob", last_name: "Boberson", email: "bob@bob.com")
        aspirational_user = User.authenticate_with_credentials("bob@bob.com", "1234567")
        expect(aspirational_user).to eq(actual_user)
      end
      it 'should get NO user if password DOES NOT match' do
        actual_user = User.create(password: "1234567", password_confirmation: "1234567", first_name: "bob", last_name: "Boberson", email: "bob@bob.com")
        aspirational_user = User.authenticate_with_credentials("bob@bob.com", "123sdf567")
        expect(aspirational_user).to_not eq(actual_user)
      end
        it 'should get the NO user if email does not match' do
        actual_user = User.create(password: "1234567", password_confirmation: "1234567", first_name: "bob", last_name: "Boberson", email: "bob@bob.com")
        aspirational_user = User.authenticate_with_credentials("bob@woot.com", "1234567")
        expect(aspirational_user).to_not eq(actual_user)
      end
        it 'should authenticate if there are spaces before or after email' do
        actual_user = User.create(password: "1234567", password_confirmation: "1234567", first_name: "bob", last_name: "Boberson", email: "bob@bob.com")
        aspirational_user = User.authenticate_with_credentials("  bob@bob.com  ", "1234567")
        expect(aspirational_user).to eq(actual_user)
      end
        it 'should authenticate if there are caps' do
        actual_user = User.create(password: "1234567", password_confirmation: "1234567", first_name: "bob", last_name: "Boberson", email: "bob@bob.com")
        aspirational_user = User.authenticate_with_credentials("BOB@bob.com", "1234567")
        expect(aspirational_user).to eq(actual_user)
      end
    end
  end
end
