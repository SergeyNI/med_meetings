require 'httparty'

class RingCaptcha
  include HTTParty

  BASE_URL = 'https://api.ringcaptcha.com'
  API_KEY = Rails.application.credentials.config[:ringcaptcha_api_key]
  APP_KEY = Rails.application.credentials.config[:ringcaptcha_app_key]

  def self.send_passcode(phone, token)
    body = { phone: phone,
      api_key: API_KEY,
      app_key: APP_KEY,
      service: 'SMS',
      locale: 'ru' }

    body.merge!(token: token) unless token.blank?

    response = post("#{BASE_URL}/#{APP_KEY}/code/SMS",
                    header: header,
                    body: body)
    response.parsed_response
  end

  def self.verify_passcode(phone, code, token)
    body = { phone: phone, code: code, api_key: API_KEY,
             app_key: APP_KEY, token: token }
    response = post("#{BASE_URL}/#{APP_KEY}/verify",
                    header: header,
                    body: body)
    response.parsed_response
  end

  def self.header
    {'Content-Type' => 'application/x-www-url-encoded; charset=utf-8'}
  end
end
