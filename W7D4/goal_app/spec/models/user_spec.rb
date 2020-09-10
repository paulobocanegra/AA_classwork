require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  subject {  User.create!(username: 'lilly_llama', password: 'password')}

  it { should validate_presence_of(:username) } 
  it { should validate_presence_of(:password_digest) } 
  it { should validate_uniqueness_of(:username) } 
  it { should validate_length_of(:password).is_at_least(6) } 
  # it { should have_many(:goals) } 

  describe 'finds users by credentials' do
  
    context 'with a valid username and password' do
      it 'should return the proper user' do
        sally = User.create(username: 'sally_lee', password: 'password')
        user = User.find_by_credentials('sally_lee','password')
  
        expect(sally.username).to eq(user.username)
        expect(sally.password_digest).to eq(user.password_digest)
      end
    end
  
    context 'with an invalid username and password' do
      it 'should return nil' do
        jack = User.create(username: 'jack_bruce', password: 'abcdef')
        user = User.find_by_credentials('jack_bruce','notthepassword')
        expect(user).to be_nil
      end
    end
  end

end




  # describe 'password encryption' do
  #   it 'does not save passwords to the database' do
  #     User.create!(username: 'sunny_d', password: 'password')
  #     sunny = User.find_by(username: 'sunny_d')
  #     expect(sunny.password).not_to be('password')
  #   end
  #   context 'it saves passwords properly' do 
  #     it 'encrypts the password using BCrypt' do
  #       expect(BCrypt::Password).to receive(:create)
  #       User.new(username: 'jack_bruce', password: 'abcdef')
  #     end

  #     it 'properly sets the password reader' do
  #       user = User.new(username: 'jack_bruce', password: 'abcdef')
  #       expect(user.password).to eq('abcdef')
  #     end
  #   end
  # end
