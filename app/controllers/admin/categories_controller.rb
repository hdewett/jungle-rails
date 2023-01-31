class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']
  
  def index
    @categories = Category.order(id: :asc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def category_quantity
    @category_quantity = Category.select("categories.name, SUM(products.quantity)").join("INNERJOIN products ON products.category_id = categories.id").group("categories.name")
  end
  helper_method :category_quantity

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
