class MailchimpController < ApplicationController
  require 'json'

  def add_mail_to_list
    if params[:mailchimp][:first_name].empty? && params[:mailchimp][:last_name].empty?
      @error = "Indtast venligst et fornavn og efternavn og prøv igen."
      render 'shared/errors/mailchimp_error.js'
    elsif params[:mailchimp][:first_name].empty?
      @error = "Indtast venligst et fornavn og prøv igen."
      render 'shared/errors/mailchimp_error.js'
    elsif params[:mailchimp][:last_name].empty?
      @error = "Indtast venligst et efternavn og prøv igen."
      render 'shared/errors/mailchimp_error.js'
    elsif params[:mailchimp][:email].empty?
      @error = "Indtast venligst en email og prøv igen."
      render 'shared/errors/mailchimp_error.js'
    else
      json_params = JSON.parse(params[:mailchimp].to_json)
      AddToMailingListJob.perform_later(json_params)
      render 'shared/notices/mailchimp_notice.js'
    end
  end


end
