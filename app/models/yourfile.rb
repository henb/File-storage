class Yourfile
  include Mongoid::Document
  include Mongoid::Paperclip

  field :file_id, type: Integer
  has_mongoid_attached_file :file

  belongs_to :user

  do_not_validate_attachment_file_type :file
  validates :file, presence: true

end
