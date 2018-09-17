require 'rspec'
require 'appium_lib'

def caps
  {
      :caps => {
          :sessionName =>        'Automation test session',
          :sessionDescription => '',
          :deviceOrientation =>  'portrait',
          :captureScreenshots => true,
          :browserName =>        'chrome',
          :deviceGroup =>        'KOBITON',
          # For deviceName, platformVersion Kobiton supports wildcard
          # character *, with 3 formats: *text, text* and *text*
          # If there is no *, Kobiton will match the exact text provided

          :deviceName =>         'Nexus 5X',
          #:deviceName =>         'Galaxy J7 Pro',

          :platformVersion =>    '8.1.0',
          #:platformVersion =>    '7.0',

          :platformName =>       'Android',
          :app =>                'kobiton-store:v16401',
          :appWaitActivity =>    'com.hubbubhealth.hubbub.app.onboarding.OnboardingActivity'
      },
      :appium_lib => {
          :server_url => 'https://TestUser0:9b76c86f-fb8e-4fca-9e24-0acbdb71a70c@api.kobiton.com/wd/hub'
      }

  }
end


Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object


user_file = File.dirname(__FILE__) + '/users.yml'
USERS = YAML.load_file(user_file)