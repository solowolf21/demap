module PageObjects
  class LoginPage < AePageObjects::Document

    path :root
    form_for :user do
      element :email
      element :password
    end

    def login!(username, password)
      email.set username
      password.set password

      node.click_on("Sign In")

      MoviesIndex.new
    end
  end

  class MoviesIndexPage < AePageObjects::Document
    path :movies

  end
end