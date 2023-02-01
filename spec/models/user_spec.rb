require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'should have a password and password_confirmation' do

      @user = User.new(first_name: 'Hilora', last_name: 'Dewett', email: 'hilora@hilora.ca', password: nil, password_confirmation: nil)
      @user.save

      expect(@user).to_not be_valid

    end

    it 'should have a matching password and password_confirmation' do

      @user = User.new(first_name: 'Hilora', last_name: 'Dewett', email: 'hilora@hilora.ca', password: 'password', password_confirmation: 'password123')
      @user.save

      expect(@user).to_not be_valid

    end

    it 'should have a unique, non case senesitive email' do

      @user = User.new(first_name: 'Hilora', last_name: 'Dewett', email: 'hilora@hilora.ca', password: 'password', password_confirmation: 'password123')
      @user.save

      @user2 = User.new(first_name: 'Hilora', last_name: 'Dewett', email: 'HILORA@HILORA.ca', password: 'password', password_confirmation: 'password123')

      expect(@user2).to_not be_valid

    end

    it 'should have an email' do

      @user = User.new(first_name: 'Hilora', last_name: 'Dewett', email: nil, password: 'password', password_confirmation: 'password123')
      @user.save

      expect(@user).to_not be_valid

    end

    it 'should have a first name' do

      @user = User.new(first_name: nil, last_name: 'Dewett', email: 'hilora@hilora.ca', password: 'password', password_confirmation: 'password123')
      @user.save

      expect(@user).to_not be_valid

    end

    it 'should have a last name' do

      @user = User.new(first_name: 'Hilora', last_name: nil, email: 'hilora@hilora.ca', password: 'password', password_confirmation: 'password123')
      @user.save

      expect(@user).to_not be_valid

    end


    it 'should have a minimum password length' do

      @user = User.new(first_name: 'Hilora', last_name: 'Dewett', email: 'hilora@hilora.ca', password: 'p', password_confirmation: 'p')
      @user.save

      expect(@user).to_not be_valid

    end

  end

  describe '.authenticate_with_credentials' do

    it 'should return an instance of the user' do
      @user = User.new(first_name: 'Custard', last_name: 'Dewett', email: 'custard@dog.ca', password: 'Ilovesteak', password_confirmation: 'Ilovesteak')
      expect(@user).to be_valid
    end

    it 'should authenticate if email contains leading or trialing space' do
      @user = User.new(first_name: 'Custard', last_name: 'Dewett', email: '     custard@dog.ca     ', password: 'Ilovesteak', password_confirmation: 'Ilovesteak')
      expect(@user).to be_valid
    end

    it 'should authenticate if email contains wrong case' do
      @user = User.new(first_name: 'Custard', last_name: 'Dewett', email: '     cUstard@dOG.CA     ', password: 'Ilovesteak', password_confirmation: 'Ilovesteak')
      expect(@user).to be_valid
    end

  end



end
