class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD'], except: :index

  private

  def product_count
    @product_count ||= Product.all.count
  end
  helper_method :product_count

  def category_count
    @category_count ||= Category.all.count
  end
  helper_method :category_count
end
