class Post < ActiveRecord::Base

    has_attached_file :image , styles: { large: "800x800" ,medium: "300x300>", thumb: "150x150#" }
    validates_attachment_content_type :image , content_type: /\Aimage\/.*\Z/

    validates :title , :description, :youtube_link , :image , presence:  true


end
