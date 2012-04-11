class Channel < ActiveRecord::Base
  
  has_one :channel_status
  has_one :signal_type
end
