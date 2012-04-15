class User < ActiveRecord::Base
  attr_accessible :address, :mission, :name, :payment_plan, :referer_id, :surname, :phone_number, :photos, :reg_number, :email
  validates_format_of :phone_number, :with => /^[0-9]/i
  has_one :referer
  validates_length_of :phone_number, :within => 11..11, :message => "enter a valid phone number"
  validates_uniqueness_of :reg_number
  validates :payment_plan, :name, :surname, :address, :email, :presence => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create


  before_create :create_reg_number
  has_attached_file :photos,
                    :path => ":rails_root/public/system/:attachment/:id/:style/:normalized_photos_file_name",
                    :styles => {:thumb => '100x100#'}, :default_url   => "/assets/missing_:style.png",
                    :url => "/system/:attachment/:id/:style/:normalized_photos_file_name"
  validates_attachment_content_type :photos, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_presence :photos
  after_create :notify_user

  Paperclip.interpolates :normalized_photos_file_name do |attachment, style|
    attachment.instance.normalized_photos_file_name
  end

  def normalized_photos_file_name
    "#{self.photos_file_name.gsub( /[^a-zA-Z0-9_\.]/, ' ')}"
  end

  def notify_user
    Notify.send_email(self).deliver
  end


  def self.search(search)
    if search
      where('user_reg_number like ?',  "%#{search}")
    else
      scoped
    end
  end

  def full_name
     "#{name}" " " "#{surname}"
  end

  private

  def create_reg_number
    self.reg_number = SecureRandom.hex(2)
  end



end
