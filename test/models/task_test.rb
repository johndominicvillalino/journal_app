require "test_helper"

class TaskTest < ActiveSupport::TestCase



  test "the truth" do
    assert true
  end


  test "test_creating" do

    @category = Category.new
    @category.save
    @task = Task.new
    @task.category_id = @category.id
  
    assert_equal @task.save, true 

  end
  

  test "category association" do

    @category = Category.create(name: "Personal")
    @task = Task.create(category_id: @category.id)
    assert_equal @task.category, @category

  end

end
