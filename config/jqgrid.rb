#===============================================================================
#                FILE: jqgrid.rb
#         DESCRIPTION: This file is used to control all the path configuration
#		       and jqgrid colmodel details.
#              AUTHOR: Suresh 
#        CREATED DATE: 12/12/2018
#    LAST MODIFIED BY: Suresh
#  LAST MODIFIED DATE: 18/12/2018
#         REVIEWED BY: sunmoon 
#       REVIEWED DATE: 18/12/2018
#===============================================================================

#Update below paths carefully
#CSV file path
#Remove the #{Rails.root} for configuring absolute path
$csv = "#{Rails.root}/CSV/audio.csv"

#ZIP file path 
#Remove the #{Rails.root} for configuring absolute path
$zipfile = "#{Rails.root}/ZIP/archive.zip"
	
#Here following path is only for testing purpose
#Remove the #{Rails.root} for configuring absolute path
#audio file path
$audio = "#{Rails.root}/audio/"


#jqgrid front-end configuration.
$colmodel = "[
	{ label: 'Id', name: 'id' },
	{ label: 'Called  Number', name: 'songs' },
	{ label: 'Voice path', name: 'file path', hidden:true, key:true,width :100 },
                ]"
