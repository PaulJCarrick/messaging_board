require 'rails_helper'
require 'comment_helper'

RSpec.describe Comment, type: :model do
  describe "Test Comment" do
    it "Created successfully" do
      expect{create_and_check_comment}.to_not raise_error
    end

    it "Found successfully" do
      comment_record = nil

      expect do
        comment_record = create_and_check_comment
      end.to_not raise_error

      comment = nil

      expect do
        comment = find_comment(comment_record.id)
      end.to_not raise_error

      expect{check_comment(comment)}.to_not raise_error

      comment = nil

      expect do
        comment = Comment.find_by(body: COMMENT_BODY)
      end.to_not raise_error

      expect{check_comment(comment)}.to_not raise_error
    end

    it "Saved successfully" do
      comment_record = nil

      expect do
        comment_record = create_and_check_comment
      end.to_not raise_error

      comment = nil

      expect do
        comment = find_comment(comment_record.id)
      end.to_not raise_error

      comment.body = 'This is a new body.'

      expect do
        comment = comment_record.save!
      end.to_not raise_error
    end

    it "Deleted successfully" do
      comment_record = nil

      expect do
        comment_record = create_and_check_comment
      end.to_not raise_error

      expect do
        comment_record.destroy
      end.to_not raise_error

      comment = comment_record

      expect do
        comment = Comment.find_by(body: COMMENT_BODY)
      end.to_not raise_error

      expect(comment).to be_nil
    end
  end
end
