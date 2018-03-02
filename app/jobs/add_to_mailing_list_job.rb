class AddToMailingListJob < ApplicationJob
  queue_as :default

  def perform(json_data)

    gibbon = Gibbon::Request.new # See config/initializers/gibbon.rb for more

    list_id = "3e676b2577"

    gibbon.lists(list_id).members.create(
      body: {
        email_address: json_data["email"], status: "pending", merge_fields: {FNAME: json_data["first_name"], LNAME: json_data["last_name"]}
      }
    )
  end
end
