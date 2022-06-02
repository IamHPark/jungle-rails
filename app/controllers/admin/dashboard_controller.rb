class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  def show
    @products_size = Product.all.count
    @categories_size = Category.all.count
  end
end
