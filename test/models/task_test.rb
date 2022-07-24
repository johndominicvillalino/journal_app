require "test_helper"

class TaskTest < ActiveSupport::TestCase


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

    @user = User.create(email:"jd@email.com",password:"qweiopqweiop")

    @category = Category.create(name: "Personal",user_id:@user.id)
    @task = Task.create(category_id: @category.id)

     assert_equal @task.category, @category

  end

end
