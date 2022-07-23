require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

    include Devise::Test::IntegrationHelpers

    setup do

        @user = users(:one)
        unless self.method_name == "test_should_be_redirected_of_not_signed_in"
            sign_in(@user)   
        end
        @category = categories(:one)  
        @category_two = categories(:two)  
     end

    test "should be redirected of not signed in" do
        get categories_path 
       follow_redirect!
       assert_response :success
    end

    test "should show category for login" do
        get categories_path
        assert_response :success
    end

    test "should destroy category" do 
        assert_difference('Category.count', -1) do
            delete category_path(@category)
        end
        assert_redirected_to categories_path
    end

    test "should create category" do
        post categories_path, params: { 
            category: {
            name: "new catasdasdas",
            user_id: @user.id
            }
        }
        assert_redirected_to categories_path
    end


    test "Category should be unqiue" do
        one = categories(:one)
        two = categories(:two)
        one.name = two.name
        assert_not one.valid?
      end

      test "should update category" do
        patch category_path(@category) , params: { category: {
            name: 'new name of cat',
            user_id: @user.id
        }}
        follow_redirect!
        assert_response :success
      end

      test "if update fails, should render edit" do
        patch category_path(@category) , params: { category: {
            name: ''
        }}
        assert_response 422
      end

      test "should fail create if params missing" do 
        post categories_path, params: {category: {
            name: ''
        }}
        assert_response 422
      end

      test 'check auth' do
        
        get category_path(@category.id) 
        assert_response :success

      end

      test 'check auth and redirect for unauth' do
        
        get category_path(@category_two.id) 
        follow_redirect!
        assert_response :success

      end


      test 'create category' do
        
      get  new_category_path
      assert_response :success

      end

 


end
