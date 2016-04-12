class Blog < ActiveRecord::Base
    validates :title, presence: true
    validates :body, presence: true
    has_attached_file :blog_photo, styles: { header: "1200x600>", thumb: "600x340>" }
    validates_attachment_content_type :blog_photo, content_type: /\Aimage\/.*\Z/    
end
