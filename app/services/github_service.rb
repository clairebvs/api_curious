class GithubService

  def initialize(current_user)
    @current_user = current_user
  end

  def user_info
    get_json("/users/#{@current_user.nickname}")
  end

  def user_followers
    get_json("/users/#{@current_user.nickname}/followers")
  end

  private

  def conn
    conn = Faraday.new(url: "https://api.github.com") do |faraday|         
      faraday.headers["Authorization"] = "token #{@current_user.oauth_token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

end
