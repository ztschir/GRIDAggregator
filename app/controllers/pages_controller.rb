class PagesController < ApplicationController
  
  def home
    @title = "Home"
    
    @h = LazyHighCharts::HighChart.new('graph') do |f|
            
            
      @receiverIDs = Receiver.find(:all, :select => 'id, name', :order => 'id')
      @transmitterIDs = Transmitter.find(:all, 
                                         :select => 'distinct transmitter_id',
                                         :conditions => 'receiver_id = 19', 
                                         :order => 'transmitter_id')
      @signalTypes = SignalType.find(:all,
                                      :select => 'name',
                                      :order => 'name')
                      
      channelData1 = Channel.joins(:signal_type).joins(:offset_time).find(:all, 
                      #:joins => 'LEFT JOIN offset_times on offset_times.id = channels.offset_time_id',
                      :select => 'pseudorange, offset_times.utc_time',
                      :conditions => "transmitter_id = 1 AND signal_types.name = 'GPS_L1_CA' AND receiver_id = 19",
                      :order => "offset_times.utc_time ASC")
                      .collect{|query| [query["utc_time"].to_datetime.to_i * 1000, query["pseudorange"]]}
      #add_missing_dates(channelData1)
          
      #channelData2 = Channel.joins(:offset_time).joins(:signal_type).find(:all, 
      #                :select => 'pseudorange, offset_times.utc_time',
      #                :conditions => "transmitter_id = 2 AND signal_types.name = 'GPS_L1_CA' AND receiver_id = 19",
      #                :order => "offset_times.utc_time ASC").collect{|query| [query["utc_time"].to_datetime.to_i * 1000, query["pseudorange"]]}


      
      #@channelDates = Array.new
      #channelData.each do |dates|
      #    stuff = Array.new
      #    stuff.push(dates.offset_time.utc_time.to_datetime.to_i * 1000)
      #    stuff.push(dates.pseudorange)
      #    @channelDates.push(stuff)
      #end  

      f.options[:chart][:defaultSeriesType] = "area"
      f.options[:xAxis][:type] = "datetime"
      f.options[:legend][:enabled] = true
      
      f.series(:name=>'Transmitter 1', :data=> channelData1)
      #f.series(:name=>'Transmitter 2', :data=> channelData2)
      
    end
    
  end
  
  require 'date'
  require 'pp'

  def add_missing_dates(series)
    series.map do |date, value|
      [date, value]
    end.inject([]) do |series, date_and_value|
      filler = if series.empty?
                 []
               else
                 ((series.last[0]+ 1)..(date_and_value[0] - 1)).map do |date|
                   [date, 0]
                 end
               end
      series + filler + [date_and_value]
    end.map do |date, value|
      [date, value]
    end
  end
  

  def team
    @title = "Team"
  end

end