require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { Order.new( customer: FactoryBot.create(:customer), product_name: "disinfectant spray", product_count: 5 )}
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
    subject.customer_id = o.1
    expect(subject).to_not be_valid
  end
  it "should have a customer" do
    order=Order.new(product_name: " toilet paper", product_count: 3)
    order.save
    expect(Order.count).to eq 0
  end
  it "should return the customer's name, product name, and product count" do
    expect(subject.to_s).to eq(customer.full_name + "has ordered " + order.product_count.to_s + order.product_name)
  end
end
