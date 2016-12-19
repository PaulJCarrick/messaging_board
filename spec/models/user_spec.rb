require 'rails_helper'
require 'user_helper'

RSpec.describe User, type: :model do
  describe "Test User" do
    it "Created successfully" do
      expect{create_and_check_user}.to_not raise_error
    end

    it "Found successfully" do
      user_record = nil

      expect do
        user_record = create_and_check_user
      end.to_not raise_error

      user = nil

      expect do
        user = find_user(user_record.id)
      end.to_not raise_error

      expect{check_user(user)}.to_not raise_error

      user = nil

      expect do
        user = User.find_by(email: EMAIL)
      end.to_not raise_error

      expect{check_user(user)}.to_not raise_error
    end

    it "Saved successfully" do
      user_record = nil

      expect do
        user_record = create_and_check_user
      end.to_not raise_error

      user = nil

      expect do
        user = find_user(user_record.id)
      end.to_not raise_error

      user.last_name = 'Smith'

      expect do
        user = user_record.save!
      end.to_not raise_error
    end

    it "Deleted successfully" do
      user_record = nil

      expect do
        user_record = create_and_check_user
      end.to_not raise_error

      expect do
        user_record.destroy
      end.to_not raise_error

      user = user_record

      expect do
        user = User.find_by(email: EMAIL)
      end.to_not raise_error

      expect(user).to be_nil
    end
  end
end
