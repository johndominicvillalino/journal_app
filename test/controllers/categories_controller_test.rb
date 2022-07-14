require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

    setup do
        @category = categories(:one)  
     end



    test "should get index" do
        get categories_path
        assert_response :success
    end

    test "should show category" do
        get category_path(@category.id)
        assert_response :success
    end

    test "should create category" do
        post categories_path, params: { 
            category: {
            name: "new cat"
            }
        }
        assert_redirected_to categories_path
    end

end
