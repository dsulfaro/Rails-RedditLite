module ApplicationHelper
  include ERB::Util

  def auth_token
    "<input
      type='hidden'
      name='authenticity_token'
      value='#{form_authenticity_token}'>".html_safe
  end

  def full_url(url)
    return url if url =~ /^http[s]?:\/\//
    "http://#{url}"
  end

  def space_content(content)
    "<pre>#{h(content).gsub(/\r?\n/, '<br/>')}</pre>".html_safe
  end

  def login_logout
    if current_user
      link_to "Logout", session_url, method: :delete
    else
      link_to "Login", new_session_url
    end
  end
end
