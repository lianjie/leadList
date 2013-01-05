class ContractGroup < ActiveRecord::Base
  attr_accessible :file, :group_name
  #session :session_key => '_upload_session_id'
  require 'csv'
  def uploadFile(file)
    if !file.original_filename.empty?
      @filename = getFileName(file.original_filename)
      source = "#{Rails.root}/public/files/#{@filename}"
      File.open(source, "wb") do |f|
        f.write(file.read)
      end
      @line = []
      File.readlines(source).each do |line|
        @line<<line
      end
      return @line
    end
  end

  def getFileName(filename)
    if !filename.nil?
      return filename
    end
  end
end
