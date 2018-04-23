module Messages
  extend ActiveSupport::Concern

  def succesfull_purchase_message
    "Din betaling er gået igennem. Vi vil inden længe sende dig en bekræftelsesemail, hvor du kan se din ordre. Vi vil gerne sige tak for din støtte!"
  end

  def missing_login_or_sign_up_message text
    "#{text} bliver du nødt til enten at #{view_context.link_to('logge ind', new_user_session_url())} eller at #{view_context.link_to('oprette en bruger', new_user_registration_url())}"
  end

  def favorite_succesfull_saved_message title
    "#{title} er blevet gemt under dine #{view_context.link_to('favoritter', user_url(current_user.id, profile: 'favorites'))}"
  end

  def favorite_missing_message
    "Favoritten findes ikke mere. Du har sandsynligvis slettet den allerede."
  end
  def favorite_already_saved_message title
    "#{title} kunne ikke gemmes, da du allerede har gemt den under dine #{view_context.link_to('favoritter', user_url(current_user.id, profile: 'favorites'))}"
  end

  def succesfully_deleted_message title
    "#{title} er blevet slettet fra dine favoritter"
  end

  def something_whent_wrong_message title
    "Noget gik galt. Det var ikke muligt at slette #{title} fra dine favoritter. Kontakt support, hvis problemet fortsætter"
  end

end
