# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


NavigationSolver.create(id:1, name:'CONVERGED')
NavigationSolver.create(id:2, name:'FAILED_TO_CONVERGE')
NavigationSolver.create(id:3, name:'TOO_FEW_SVS_AFTER_PRUNING')
NavigationSolver.create(id:4, name:'ITAR_VIOLATION')
NavigationSolver.create(id:5, name:'CONVERGED_BUT_LARGE_RESIDUAL')
NavigationSolver.create(id:6, name:'TOO_FEW_SVS')

ChannelStatus.create(id:1, name:'NULL')
ChannelStatus.create(id:2, name:'ALLOCATED')
ChannelStatus.create(id:3, name:'ACQUIRED')
ChannelStatus.create(id:4, name:'SYMBOL_LOCK')
ChannelStatus.create(id:5, name:'FREQ_LOCK')
ChannelStatus.create(id:6, name:'PHASE_LOCK')
ChannelStatus.create(id:7, name:'DATA_LOCK')

SignalType.create(id:1, name:'GPS_L1_CA')
SignalType.create(id:2, name:'GPS_L2_CM')
SignalType.create(id:3, name:'GPS_L2_CL')
SignalType.create(id:4, name:'GPS_L2_CLM')
SignalType.create(id:5, name:'GPS_L5_I')
SignalType.create(id:6, name:'GPS_L5_Q')
SignalType.create(id:7, name:'GPS_L5_IQ')
SignalType.create(id:8, name:'GPS_L1_CA_ALT1')
SignalType.create(id:9, name:'CDMA_UHF_PILOT')
SignalType.create(id:10, name:'CDMA_UHF_SYNC')

SystemType.create(id:1, name:'GPS')
SystemType.create(id:2, name:'GALILEO')
SystemType.create(id:3, name:'GLONASS')
SystemType.create(id:4, name:'CDMA')

LeapSecond.create(date: DateTime.parse("30/06/1972"))
LeapSecond.create(date: DateTime.parse("30/12/1972"))
LeapSecond.create(date: DateTime.parse("30/12/1973"))
LeapSecond.create(date: DateTime.parse("30/12/1974"))
LeapSecond.create(date: DateTime.parse("30/12/1975"))
LeapSecond.create(date: DateTime.parse("30/12/1976"))
LeapSecond.create(date: DateTime.parse("30/12/1977"))
LeapSecond.create(date: DateTime.parse("30/12/1978"))
LeapSecond.create(date: DateTime.parse("30/12/1979"))
LeapSecond.create(date: DateTime.parse("30/06/1981"))
LeapSecond.create(date: DateTime.parse("30/06/1982"))
LeapSecond.create(date: DateTime.parse("30/06/1983"))
LeapSecond.create(date: DateTime.parse("30/06/1985"))
LeapSecond.create(date: DateTime.parse("30/12/1987"))
LeapSecond.create(date: DateTime.parse("30/12/1989"))
LeapSecond.create(date: DateTime.parse("30/12/1990"))
LeapSecond.create(date: DateTime.parse("30/06/1992"))
LeapSecond.create(date: DateTime.parse("30/06/1993"))
LeapSecond.create(date: DateTime.parse("30/06/1994"))
LeapSecond.create(date: DateTime.parse("30/12/1995"))
LeapSecond.create(date: DateTime.parse("30/06/1997"))
LeapSecond.create(date: DateTime.parse("30/12/1998"))
LeapSecond.create(date: DateTime.parse("30/12/2005"))
LeapSecond.create(date: DateTime.parse("30/12/2008"))
LeapSecond.create(date: DateTime.parse("30/06/2012"))

