require 'spec_helper'

describe Product do 

  context "when the product has comments" do
    let(:product) { Product.create!(name: "race bike") }
    let(:user) { User.create!(first_name: "John", last_name: "Smith", email: "j.smith@example.com", password: "xyzxyz") }
  end

  it "returns the average rating of all comments" do 
    product.comments.create!(rating: 1, user: user, body: "Awful bike!")
    product.comments.create!(rating: 3, user: user, body: "Ok bike!")
    product.comments.create!(rating: 5, user: user, body: "Great bike!")
    expect(product.average_rating).to eq(3)
  end


  it "is not valid without a product name" do
    expect(Product.new(description: "Nice bike")).not_to be_valid
  end

end



