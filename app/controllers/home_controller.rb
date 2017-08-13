class HomeController < ApplicationController

        def index
	end

	def run_c
		file = File.open('tmp/one.c', 'w')
        file.syswrite(params[:code])
        file.close
        file = File.open('tmp/testcases.txt','w')
        file.syswrite(params[:testcases])
        file.close
        system('gcc tmp/one.c -o tmp/one.out')
        system('./tmp/one.out < tmp/testcases.txt > tmp/result.txt')
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
