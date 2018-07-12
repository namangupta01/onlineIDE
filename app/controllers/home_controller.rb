class HomeController < ApplicationController

  after_filter :del

  def index
    @a=0

      if params[:language]=="ruby"
        file = File.open('tmp/code.rb', 'w')
        file.syswrite(params[:code])
        file.close
        file = File.open('tmp/input.txt','w')
        file.syswrite(params[:input])
        file.close
        status = system('ruby tmp/code.rb < tmp/input.txt > tmp/result.txt')
        byebug
        if status == false
          system('ruby tmp/code.rb >& tmp/result.txt')
        end
        @result = File.read('tmp/result.txt')
        save_submission status, @result
        @a=1
      elsif params[:language]=="c"
        file = File.open('tmp/code.c', 'w')
        file.syswrite(params[:code])
        file.close
        file = File.open('tmp/input.txt','w')
        file.syswrite(params[:input])
        file.close
        status = system('gcc tmp/code.c -o tmp/code.out')
        system('./tmp/code.out < tmp/input.txt > tmp/result.txt')
        if status == false
          system('gcc tmp/code.c >& tmp/result.txt')
        end
        @result = File.read('tmp/result.txt')
        save_submission status, @result
        @a = 1
      end
    render 'index'
  end

  def run_c
    file = File.open('tmp/code.c', 'w')
    file.syswrite(params[:code])
    file.close
    file = File.open('tmp/input.txt','w')
    file.syswrite(params[:input])
    file.close
    system('gcc tmp/code.c -o tmp/code.out')
    system('./tmp/code.out < tmp/input.txt > tmp/result.txt')
    @result = File.read('tmp/result.txt')
    @a = 1
    render 'index'
  end

  def run_ruby
    file = File.open('tmp/code.rb', 'w')
    file.syswrite(params[:code])
    file.close
    system('ruby tmp/code.rb > tmp/result.txt')
    @result = File.read('tmp/result.txt')
    @a=1
    render 'index'
  end

  def run
    byebug
  end



  def del 
    if params[:lang]=="ruby"
      File.delete('tmp/code.rb')
      File.delete('tmp/result.txt')
    elsif params[:lang]=="c"
      File.delete('tmp/code.c')
      File.delete('tmp/result.txt')
    end
    
  end

  def save_submission status , result
    language_validation = UserSubmission.validates_language_params params[:language]
    user_submission = UserSubmission.new
    user_submission.user_id = current_user.id
    user_submission.language = params[:language]
    user_submission.extension = (UserSubmission.languages.values_at user_submission.language)[0]
    user_submission.code = params[:code]
    user_submission.input = params[:input]
    user_submission.success = status
    user_submission.output = result
    user_submission.save
  end

end
