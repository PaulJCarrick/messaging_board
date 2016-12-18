require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).not_to have_http_status(:error)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).not_to have_http_status(:error)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).not_to have_http_status(:error)
    end
  end
end
