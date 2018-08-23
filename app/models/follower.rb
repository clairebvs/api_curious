class Follower
  attr_reader :login, :url, :id

  def initialize(data)
    @login = data[:login]
    @url   = data[:html_url]
    @id    = data[:id]
  end

end
