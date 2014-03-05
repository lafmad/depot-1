require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "add a unique product" do
    cart = carts(:one)
    product = Product.new(title: "TitleTitle", description: "Description", image_url: "url.jpg", price: 100)
    assert product.save, 'Failed to save the product'
    current_item = cart.add_product(product.id)
    current_item.save
    assert_equal product.price, current_item.price, 'The prices of product and line item are not the same'
    assert_equal 1, current_item.quantity, "The quantity of the line item is #{current_item.quantity}"
  end

	test "add duplicate products" do
    cart = carts(:one)
    product = Product.new(title: "TitleTitle", description: "Description", image_url: "url.jpg", price: 100)
    assert product.save, 'Failed to save product'
    current_item = cart.add_product(product.id)
    current_item.save
    assert_equal product.price, current_item.price, 'The prices of product and line item are not the same'
    current_item = cart.add_product(product.id)
    current_item.save
    assert_equal product.price, current_item.price, 'The prices of product and line item are not the same'
    assert_equal 2, current_item.quantity, "The quantity of the line item is #{current_item.quantity}"
  end

end
