require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

 
    test 'resource name test' do

        assert_equal resource_name,:user

    end
 
    test 'resource test' do

        assert_equal resource, User.new

    end


end