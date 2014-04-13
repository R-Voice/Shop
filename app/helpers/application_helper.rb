module ApplicationHelper
	def hidden_div_if(condition, attributes={}, &block)
		if condition
			attributes["style"]="display:none"
		end
		content_tag("div", attributes, &block)
	end

	def set_title(page_title)
		base_title = 'Guitar Shop'
		if page_title.empty?
			base_title
		else
			"#{page_title} || #{base_title}"
		end
	end

	def after_sign_in_path_for(resource)
  	current_user_path
	end

	def after_sign_out_path_for(resource_or_scope)
 	 request.referrer
	end

end
