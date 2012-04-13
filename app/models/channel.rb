class Channel < ActiveRecord::Base
  
  belongs_to :offset_time
  belongs_to :channel_status
  belongs_to :signal_type
end
