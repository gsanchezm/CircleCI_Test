require_relative '../controller'

class MainPage < Controller

  def select_icon_bottom(icon)
    case icon.downcase
    when 'user'
      select_user_bottom_icon
    when 'activity feed'
      select_activity_feed_icon
    when 'challenge'
      select_my_challenges_icon
    when 'coach'
      select_coach_section_icon
    when 'company'
      select_company_icon
    end
  end

  def select_user_bottom_icon
    get_elements_inside_element('tabs_indicator', 'android.widget.ImageView')[0].click
  end

  def select_activity_feed_icon
    get_elements_inside_element('tabs_indicator', 'android.widget.ImageView')[1].click
  end

  def select_my_challenges_icon
    get_elements_inside_element('tabs_indicator', 'android.widget.ImageView')[2].click
  end

  def select_coach_section_icon
    get_elements_inside_element('tabs_indicator', 'android.widget.ImageView')[3].click
  end

  def select_company_icon
    get_elements_inside_element('tabs_indicator', 'android.widget.ImageView')[4].click
  end

  def get_all_activity_challenges
    total_elements = get_elements_inside_element('feed_list', 'android.widget.LinearLayout').size.to_s
  end

  def click_on_challenge(challenge)
    element(challenge).click
  end

  def check_in_mood
    puts elements('icon_action')[0].click
  end

  def select_fist_bump
    get_elements_inside_element('feed_list', 'android.widget.LinearLayout').each {|element|
      text_element = element.find_elements(class_name: 'android.widget.LinearLayout')[0].find_elements(class_name: 'android.widget.TextView')[0]
      if text_element.text.eql? '0'
        text_element.click
      elsif text_element.text.eql? '1'
        puts 'Fistbump exist and checked!'
      end
    }
  end

  def select_comment
    click_on_element('feed_item_comments')
    wait 5
  end

  def type_search(text)
    type_on_element('edit_search', text)
  end
end