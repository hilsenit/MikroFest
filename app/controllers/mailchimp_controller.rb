class MailchimpController < ApplicationController
  require 'json'

  def add_mail_to_list
    json_params = JSON.parse(params[:mailchimp].to_json)
    AddToMailingListJob.perform_later(json_params)
  end


end
