require 'rails_helper'
RSpec.describe "OrdersControllers", type: :request do
  describe "get orders_path" do
    it "renders the index view " do
      FactoryBot.create_list(:order, 10)
      get orders_path
      expect(response.status).to eq(200)
    end
  end
  describe "post orders_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      order_attributes = FactoryBot.attributes_for(:order)
      order_attributes[:customer_id] = FactoryBot.create(:customer).id
      expect {post orders_path, {order: order_attributes}}.to change(Order, :count)
      expect(response).to redirect_to order_path(id: Order.last.id)
    end
  end
  describe "GET /index" do
    it "returns http success" do
      get "/orders/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/orders/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/orders/show"
      expect(response).to have_http_status(:success)
    end
  end

end
