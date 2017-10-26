class HomeController < ApplicationController

  after_filter :del

  def index
    @a=0

    if params[:lang]=="ruby"
      file = File.open('tmp/ruby.rb', 'w')
      file.syswrite(params[:code])
      file.close
      file = File.open('tmp/testcases.txt','w')
      file.syswrite(params[:testcases])
      file.close
          byebug
      status = system('ruby tmp/ruby.rb < tmp/testcases.txt > tmp/result.txt')
      if status == false
        system('ruby tmp/ruby.rb >& tmp/result.txt')
      end
      @result = File.read('tmp/result.txt')
      @a=1
    elsif params[:lang]=="c"
      file = File.open('tmp/one.c', 'w')
      file.syswrite(params[:code])
      file.close
      file = File.open('tmp/testcases.txt','w')
      file.syswrite(params[:testcases])
      file.close
      byebug
      status = system('gcc tmp/one.c -o tmp/one.out')
      system('./tmp/one.out < tmp/testcases.txt > tmp/result.txt')
      if status == false
        system('gcc tmp/one.c >& tmp/result.txt')
      end
      @result = File.read('tmp/result.txt')
      @a = 1
    end
    render 'index'
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
    @a = 1
    byebug
    render 'index'
  end

  def run_ruby

    file = File.open('tmp/ruby.rb', 'w')
    file.syswrite(params[:code])
    file.close
    system('ruby tmp/ruby.rb > tmp/result.txt')
    @result = File.read('tmp/result.txt')
    @a=1
    render 'index'
  end



  def del 
    if params[:lang]=="ruby"
      File.delete('tmp/ruby.rb')
      File.delete('tmp/result.txt')
    elsif params[:lang]=="c"
      File.delete('tmp/one.c')
      File.delete('tmp/result.txt')
    end
    
  end

end
