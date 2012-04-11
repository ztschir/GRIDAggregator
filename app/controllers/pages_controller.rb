class PagesController < ApplicationController
  def home
    @title = "Home"
    
    @chart = Highcharts.new
    @chart.chart({:renderTo => 'graph'})
    @chart.title('Highcharts Example')
    @chart.xAxis([{:categories => ['October 12', 'October 13', 'October 14']}])
    @chart.yAxis([{:title => 'Impressions', :min => 0}])
    @chart.series([{:name => 'Impressions', :yAxis => 0, :type => 'line', :data => [100000, 122000, 127000]}])
    @chart.legend({:layout => 'vertical', :align => 'right', :verticalAlign => 'top', :x => -10, :y => 100, :borderWidth => 0})
    @chart.tooltip({:formatter => "function(){ return '<b>' + this.series.name + '</b><br/>' + this.x + ': ' + this.y; }"})
    
  end

  def team
    @title = "Team"
  end

end