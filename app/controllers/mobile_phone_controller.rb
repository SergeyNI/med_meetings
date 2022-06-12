class MobilePhoneController < ApplicationController
  # before_action :authorize_access_request!
  require 'ring_captcha'
  def send_cofirm_code
    response = RingCaptcha.send_passcode(send_cofirm_code_params[:phone], send_cofirm_code_params[:token])
    # puts response
    render json: response
  end

  def verify_confirm_code
    response = RingCaptcha.verify_passcode(verify_confirm_code_params[:phone],
                                           verify_confirm_code_params[:confirm_code],
                                           send_cofirm_code_params[:token])
    render json: response
  end

  private

  def send_cofirm_code_params
    params.permit(:phone, :token)
  end

  def verify_confirm_code_params
    params.permit(:phone, :confirm_code, :token)
  end

end