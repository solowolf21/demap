require 'selenium_helper'

class LoginTest < SeleniumTestCase
  def test_login__success
    login_page = PageObjects::LoginPage.visit
  end
end