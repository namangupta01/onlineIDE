class HomeController < ApplicationController

	def index
	end

	def run_c
		file = File.open('tmp/one.c', 'w')
        file.syswrite(params[:code])
        file.close
        system('gcc tmp/one.c -o tmp/one.out')
        byebug
        system('./tmp/one.out > tmp/result.txt')
        @result = File.read('tmp/result.txt')
        render 'run'
	end

	def run_ruby
		file = File.open('tmp/ruby.rb', 'w')
        file.syswrite(params[:code])
        file.close
        system('ruby tmp/ruby.rb > tmp/result.txt')
        @result = File.read('tmp/result.txt')
        render 'run'
	end

end
