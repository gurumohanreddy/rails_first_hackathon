class Post < ActiveRecord::Base

  def self.youtubecode
      self.youtube_link.split('=').last if self.youtube_link
  end

end
