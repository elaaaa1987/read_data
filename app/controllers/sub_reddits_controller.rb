class SubRedditsController < ApplicationController
 before_action :get_json_data
 before_action :set_params

  def index
  begin
  	@sub_reddit = SubReddit.create(set_params)
  		respond_to do |format|
	  		if @sub_reddit
	  			format.html { redirect_to sub_reddits_index, notice: 'Successfully created.' }
	  		else
	  		end
  	    end

  rescue Exception => e
  	p e.message
  end

  end

  private

  def get_json_data
  	response = HTTParty.get('https://www.reddit.com/r/politics/about.json')
  	if(response.code == 200)   		
  		response_data = JSON.parse(response.body)
  		params[:politics_code] = response_data["data"]["id"]
  		params[:description] = response_data["data"]["description"]
  		params[:banner_image] = response_data["data"]["banner_img"]
  		params[:response_data] = response
  	end
  end

  def set_params
  	params.permit(:politics_code, :description, :banner_image, :response_data
)
  end

end
