module ApplicationHelper
	def login_helper
		if current_user.is_a?(GuestUser) 
      (link_to 'Login', user_session_path) + " " +
      (link_to 'Register', new_user_registration_path) 
    else 
      (link_to 'Edit_User', edit_user_registration_path) + " " +
      (link_to 'Logout', destroy_user_session_path, method: :delete) 
    end	
	end

	def source_helper(layout_name)
		if session[:source]
			greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
			content_tag(:p, greeting, class: "source-greeting")
	end
end

def copyright_generator
		HigginsViewTool::Renderer.copyright 'Cody Higgins', 'Don\'t touch my code'
	end
end

