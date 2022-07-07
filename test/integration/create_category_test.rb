class CreateCategoryTest < ActionDispatch::IntegrationTest

    test "should create a new category" do

        get categories_new_path
        assert_response :success

        assert_difference 'Category.count',1 do
            post categories_path, params: {name: "Personal"}
            assert_response :success
        end

    end

end
