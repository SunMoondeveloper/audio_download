#===============================================================================
#                FILE: home_controller.rb
#         DESCRIPTION: To load the csv data and create a downlink for equivalent
#		       audio files based on csv details
#              AUTHOR: Suresh 
#        CREATED DATE: 12/12/2018
#    LAST MODIFIED BY: Suresh 
#  LAST MODIFIED DATE: 18/12/2018
#         REVIEWED BY: sunmoon
#       REVIEWED DATE: 18/12/2018
#===============================================================================

class HomeController < ApplicationController
require 'zip'
require 'csv'
require 'json'
#before doing any changes in this file, check config/jqgrid.rb file, It may be helpful 
require "#{Rails.root}/config/jqgrid.rb"
require 'logger'
$logger=Logger.new("#{Rails.root}/log/audio.log",5, 1024000)
$logger2=Logger.new("#{Rails.root}/log/initdetails.log",3, 1024000)
$logger.datetime_format = '%d-%m-%Y %H:%M:%S:%3N'
$logger.level = Logger::DEBUG



#=== FUNCTION NAME  =============================================================
#       NAME            : Index
#       PURPOSE         : To load the jqgrid page
#       PARAMETERS      : Nil
#       RETURN          : HTML data
#       DESCRIPTION     : While accessing the page this function loads the 
#			  html details to front end.
#===============================================================================
	def index
		csvfile = $csv
		unless File.exist?(csvfile)
			# suppose the CSV file is missing, that time below message will be showed.
			render :html => "Sorry!!! for inconvenience, we will resolve shortly!"
                end
			#render :html => "Sorry!!! for inconvenience, we will resolve shortly!"

	end

#=== FUNCTION NAME  =============================================================
#       NAME            : data
#       PURPOSE         : Handles CSV data
#       PARAMETERS      : jqgrid page,sort,rows..etc
#       RETURN          : JSON data
#       DESCRIPTION     : Read a CSV file and convert CSV into json format.
#===============================================================================

	def data
        	if request.method == "GET"
			#This is tmp path for testing
			#csvfile = Rails.root + "CSV/bksvfr_calldetails_master.csv"

			# csv file path .
			csvfile = $csv
			lines = CSV.open(csvfile).readlines
			# Remove the first line from the csv file, because it is in index details
			# So we don't need those details
			keys = lines.delete lines.first
			# conver csv to json.
 			jsondata = JSON.pretty_generate(lines)
        	        render json: jsondata
			
        	end
	end

#=== FUNCTION NAME  =============================================================
#       NAME            : ajaxdownload
#       PURPOSE         : Handles download request from the client
#       PARAMETERS      : file path
#       RETURN          : audio file or zip file
#       DESCRIPTION     : Check all download request file(s) where it is exist or not
#			  It creates a downlink and send it to the client.
#===============================================================================

	def ajaxdownload
		$logger.info("ajax download request received from "+ request.ip);
        	if request.method == "GET"
			#create a array from hash value
			filenames = params[:files].split(',');
			@filechecking ="";
			#check the file(s) whether it is exist or not.
			# if the file(s) is not exist, concat all file names in a variable
			# send the value(s) to the client. 
			filenames.each do |file|
				 unless File.exist?(file)
				 	@filechecking = @filechecking.to_s + "#{file}\n" 
				 end
			end
			#send the missing file(s) name to the client
			if @filechecking.split(',').length != 0
				$logger.error(" files are missing #{@filechecking} from "+ request.ip);
				render :html => "#54: #{@filechecking}"
				return 1;
			end
			#If everything is fine then create the download link.
			respond_to do |format|
				$logger.info("download request create for "+ request.ip);
				@java_url = "/download?files=#{params[:files]}"
  				format.js {render :partial => "downloadFile"}
			end
		end
	end

#=== FUNCTION NAME  =============================================================
#       NAME            : download
#       PURPOSE         : To download the audio files
#       PARAMETERS      : file(s) name
#       RETURN          : download page
#       DESCRIPTION     : Fetch the audio file and send it. If there is more than
#			  one files, then create a zip and send it
#===============================================================================

	def download
		$logger.info("download request received "+ request.ip);
        	if request.method == "GET"
			if params[:files].split(',').length == 1
				fname = params[:files].split(',').first
				$logger.info("file send to "+ request.ip);
				send_file fname, :type=>"audio/mp3", :filename => File.basename(fname)
			else
				#folder = Rails.root + "audio/" 
				#folder = $audio 
				input_filenames = params[:files].split(',');
				#Avoid duplicate files
				input_filenames.uniq!
				#update the archive file name with timestamp
				#like archive_1.zip_timestamp for avoid file name conflict
				#zipfile_name = Rails.root + "CSV/archive.zip"
				ctime = Time.now
				zipfile_name = $zipfile+"_#{ctime.strftime("%d_%m_%Y_%H_%M_%S_%3N")}"
				#read all the files from directory
				exfile =  Dir[File.dirname(zipfile_name)+"/*"];
				exfile.each do |f|
					ftime = File.new(f).ctime
					rtime = Time.now
					if ((rtime-ftime) / 1.minute).round > 15
						#delete zip file which is created before 15 minutes
						File.delete(f) if File.exist?(f)
					end
				end
				#zip all audio files.
				begin
					Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
					input_filenames.each do |filename|
					   	file = File.basename(filename)
					   	folder = File.dirname(filename)
					   	zipfile.add(file, filename)
					  end
					end
				$logger.info("file send to "+ request.ip);
				# send a file to requested machine
				send_file zipfile_name, :type=>"application/zip", :filename => File.basename(zipfile_name).split('_').first
				rescue
					$logger.error("zip file error for "+ request.ip);
					puts "Duplicate files"
					# if any error occur show below message
					render :html => "Sorry!!! for inconvenience, we will resolve shortly!"
				end
			end
        	end
	end

end
