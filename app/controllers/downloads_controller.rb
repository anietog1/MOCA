class DownloadsController < ApplicationController
  def index
  end

  def students
    respond_to do |format|
      format.html
      format.csv {
        send_data Student.to_csv, filename: "students-#{Date.today}.csv"
      }
    end
  end
end
