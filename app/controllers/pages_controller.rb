class PagesController < ApplicationController
  
  def home
    @title = "Home"
    
    @h = LazyHighCharts::HighChart.new('graph') do |f|

      channelData = Channel.joins(:offset_time).find(:all,
                      :conditions => "`transmitter_id` = 1",
                      :order => "`utc_time` ASC")
          
      @channelDates = Array.new
      #@counter = 0
      channelData.each do |dates|
        #if (@counter % 2 == 0 )
          stuff = Array.new
          stuff.push(dates.offset_time.utc_time.to_datetime.to_i * 1000)
          stuff.push(dates.pseudorange)
          @channelDates.push(stuff)
        #end
        #@counter = @counter + 1;
      end  

      f.options[:chart][:defaultSeriesType] = "area"
      f.options[:xAxis][:type] = "datetime"
      
      f.series(:name=>'Transmitter 1', :data=> @channelDates)
      
    end
    
  end

  def team
    @title = "Team"
  end

end