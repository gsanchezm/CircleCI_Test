require_relative '../../../features/support/controller'

class CompanyPage < Controller

  def enter_company_code (company_code)
    type_on_element('company_connect_edit_code', company_code)
    wait(2)
    click_on_element('company_connect_btn_continue')
  end

  def disconnect_from_company
    type_on_element('input','disconnect')
    wait(2)
    click_on_element('buttonDefaultPositive')
  end

  def click_on_reward(reward_name)
    click_on_element(reward_name)
  end
end