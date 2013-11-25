class VersionMapper < ActiveRecord::Base
  serialize :children
end
