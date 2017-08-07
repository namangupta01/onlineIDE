class HomeController < ApplicationController

	def index
	end


	def run
		file = File.open('tmp/ruby.rb', 'w')
        file.syswrite(params[:code])
        file.close
        system('ruby tmp/ruby.rb > tmp/result.txt')
        @result = File.read('tmp/result.txt')
	end

end
