


require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

    include Devise::Test::IntegrationHelpers

    setup do
        @user = users(:one)
       sign_in @user
    end


    test 'redirect if user is not logged in' do

    get root_path
    assert_response 302
    
    end


end