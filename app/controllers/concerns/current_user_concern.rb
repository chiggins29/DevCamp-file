module CurrentUserConcern
	extend ActiveSupport::Concern

  #nul object pattern
  def current_user
  	super || guest_user
  end

  def guest_user
  	OpenStruct.new(name: "Welcome Guest", 
  									first_name: "User", 
  									last_name: "Guest", 
  									email: "blahblah@blah.com")
  end
end