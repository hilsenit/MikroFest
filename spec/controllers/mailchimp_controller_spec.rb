require 'rails_helper'

RSpec.describe MailchimpController, type: :controller do
  describe '#add_mail_to_list' do
      let(:input_params) { { mailchimp: { email: "eksempel@gmail.com", first_name: "Mig", last_name: "Hahah" } } }

      it "when all input fields is filled render succes notice" do
        post :add_mail_to_list, params: input_params
        expect(response).to render_template("shared/notices/mailchimp_notice.js")
      end

      it "when one (first_name) input is missing render error message" do
        input_params[:mailchimp][:first_name] = ""
        post :add_mail_to_list, params: input_params
        expect(response).to render_template("shared/errors/mailchimp_error.js")
      end


      it "when one (email) input is missing render error message" do
        input_params[:mailchimp][:email] = ""
        post :add_mail_to_list, params: input_params
        expect(response).to render_template("shared/errors/mailchimp_error.js")
      end

  end
end
