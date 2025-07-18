class AngularController < ActionController::Base
  def index
    render file: File.join(Rails.root, 'public/browser/index.html'), layout: false
  end
end