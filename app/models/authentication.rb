class Authentication < ActiveRecord::Base
  belongs_to :user

  after_create :fetch_details

  def fetch_details
    self.send("fetch_details_from_#{self.provider.downcase}")
  end

  def fetch_details_from_facebook
    graph = Koala::Facebook::API.new(self.token)
    facebook_data = graph.get_object("me")
    self.username = facebook_data['username']  rescue ''
    self.save
    self.user.username = facebook_data['username']  rescue '' if self.user.username.blank?
    self.user.remote_image_url = facebook_data['image'] rescue ''
    self.user.location = facebook_data['location']  rescue '' if self.user.location.blank?
    self.user.save
  end
end
