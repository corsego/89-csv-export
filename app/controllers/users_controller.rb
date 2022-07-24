class UsersController < ApplicationController
  def import
    file = params[:file]
    return redirect_to users_path, notice: 'Only CSV please' unless file.content_type == 'text/csv'

    CsvImportUsersService.new.call(file)

    redirect_to users_path, notice: 'Users imported!'
  end

  def index
    @users = User.limit(10)
    respond_to do |format|
      format.html
      format.csv do
        filename = ['Users', Date.today.to_s].join(' ')
        send_data User.to_csv(@users), filename:, content_type: 'text/csv'
      end
    end
  end
end
