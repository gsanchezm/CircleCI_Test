require_relative '../../../features/support/controller'

class LoginPage < Controller

  def current_server_displayed?
    element_displayed?('txt_debug_server')
  end

  def image_carousel_displayed?
    element_displayed?('android.widget.LinearLayout')
  end

  def email_field_displayed?
    element_displayed?('edit_email')
  end

  def facebook_button_displayed?
    element_displayed?('btn_loginfb')
  end

  def login_regence_displayed?
    element_displayed?('btn_regence_login')
  end

  def email_password_displayed?(text)
    text.eql?('Email') ? email_field_displayed? : element_displayed?(text)
  end

  def change_server
    server = element('txt_debug_server')
    server.click
    server.text
  end

  def login_buttons_displayed?(text)
    if text.eql?('Facebook')
      facebook_button_displayed?
    elsif text.eql?('Login in with Regence')
      login_regence_displayed?
    else
      element_displayed?(text)
    end
  end

  def login_with(user)
    type_on_element('edit_email', USERS[user]['email'])
    type_on_element('edit_pass', USERS[user]['password'])
    tap(994.9, 1724.8, 1)
    wait(3)
  end

end
