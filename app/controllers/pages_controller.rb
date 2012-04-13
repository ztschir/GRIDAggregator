class PagesController < ApplicationController
  
  def home
    @title = "Home"
    
    @h = LazyHighCharts::HighChart.new('graph') do |f|
      
      channelData = Channel.joins(:offset_time).order("utc_time").limit(100)
      
      @channelDates = channelData.pluck(:utc_time)
      
      f.options[:chart][:defaultSeriesType] = "area"
      #f.series(:name=>'Time', :data=> channelData.pluck(:utc_time))
      f.series(:name=>'Pseudorange', :data=> channelData.pluck(:pseudorange))
      f.xAxis(:categories => channelData.pluck(:utc_time) , :labels=>{:rotation=>-45 , :align => 'right'})
      
    end
    
  end

  def team
    @title = "Team"
  end

end