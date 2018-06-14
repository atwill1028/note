module NavigationHelper

  def header_top_partial_path
    if user_signed_in?
      'layouts/header_top/signed_in_header'
    else
      'layouts/header_top/non_signed_in_header'
    end
  end

end
