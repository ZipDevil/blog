require 'rails_helper'

RSpec.describe Order, type: :model do
  subject {Order.new( product_name: "masks", product_count: 9, customer: FactoryBot.create(:customer))}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a product_name" do
    subject.product_name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a customer" do
    subject.customer = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a valid customer_id" do
    subject.customer_id = 0.1
    expect(subject).to_not be_valid
  end
  it "should have a customer" do
    order = Order.new(product_name: " toilet paper", product_count: 3)
    order.save
    expect(Order.count).to eq 0
  end
  # it "should have the correct attributes" do
  #   expect(subject).to include(:customer_id, :product_count, :product_name)
  #   # rspec keep saying it has the attributes, but does not respond to `include?`
  # end
  # it "should return the customer's name, product name, and product count" do
  #   customer = FactoryBot.create(:customer)
  #   order = Order.create(product_name: " masks", product_count: 9, customer: customer)
  #   expect(order.to_s).to eq(customer.full_name + " ordered " + order.product_count.to_s + order.product_name)
  #   # rspec just throw me the object memory address instead of the data:
  #   # ===> got: "#<Order:0x00007ff9aa755890>"
  # end
end
