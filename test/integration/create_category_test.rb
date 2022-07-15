class CreateCategoryTest < ActionDispatch::IntegrationTest

    test "should create a new category" do

        get new_category_path
        assert_response :success

        assert_difference 'Category.count',1 do
            post categories_path, params: {category: {name: "Personal"}}
            follow_redirect!
            assert_equal 200, status
        end

    end

end
