require 'rails_helper'
require 'post_helper'

RSpec.describe Post, type: :model do
  describe "Test Post" do
    it "Created successfully" do
      expect{create_and_check_post}.to_not raise_error
    end

    it "Found successfully" do
      post_record = nil

      expect do
        post_record = create_and_check_post
      end.to_not raise_error

      post = nil

      expect do
        post = find_post(post_record.id)
      end.to_not raise_error

      expect{check_post(post)}.to_not raise_error

      post = nil

      expect do
        post = Post.find_by(title: TITLE)
      end.to_not raise_error

      expect{check_post(post)}.to_not raise_error
    end

    it "Saved successfully" do
      post_record = nil

      expect do
        post_record = create_and_check_post
      end.to_not raise_error

      post = nil

      expect do
        post = find_post(post_record.id)
      end.to_not raise_error

      post.body = 'This is a new body.'

      expect do
        post = post_record.save!
      end.to_not raise_error
    end

    it "Deleted successfully" do
      post_record = nil

      expect do
        post_record = create_and_check_post
      end.to_not raise_error

      expect do
        post_record.destroy
      end.to_not raise_error

      post = post_record

      expect do
        post = Post.find_by(title: TITLE)
      end.to_not raise_error

      expect(post).to be_nil
    end
  end
end
