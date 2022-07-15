require "test_helper"

class TaskTest < ActiveSupport::TestCase



  # test "the truth" do
  #   assert true
  # end


  test "test_creating" do

    cat = categories(:one)
    @task = Task.new
    @task.category_id = cat.id
    @task.name = "name"
    @task.description = "name"
    @task.deadline = Time.new
  
    assert @task.save 

  end
  

  test "category association" do

    @category = Category.create(name: "Personal")
    @task = Task.create(category_id: @category.id)
    assert_equal @task.category, @category

  end

end
