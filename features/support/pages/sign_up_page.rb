require_relative '../../../features/support/controller'

class SignUpPage < Controller
  def new_user
    user = 'gilberto.aspros' + (rand(99999).to_s) + '@gmail.com'
    pass = 'Password.1'
    type_on_element('edit_email', user)
    type_on_element('edit_pass', pass)
    wait(3)
    File.open('random_user.txt', 'a') do |line|
      line.puts('Email: ' + user + '   Password: ' + pass + "\n")
    end
    tap(994.9, 1724.8, 1)
    wait(3)
  end

  def click_on_age_checkbox
    click_on_element('chk_13orolder')
  end
end