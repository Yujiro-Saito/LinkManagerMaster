class Link < ActiveRecord::Base
  belongs_to :folder
  belongs_to :user
end
