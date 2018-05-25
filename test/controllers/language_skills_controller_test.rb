require 'test_helper'

class LanguageSkillsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get language_skills_create_url
    assert_response :success
  end

end
