require_relative 'config/environment'

class App < Sinatra::Base

  get '/reversename/:name' do
    @name = params[:name]
    @name.reverse
  end

  get '/square/:number' do
    @number = params[:number].to_i
    "#{@number * @number}"
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    print_me = ""
    @number.times do |num|
      print_me += @phrase + "\n"
    end
    print_me
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end


  # Create a dynamic route at get '/:operation/:number1/:number2' that accepts an operation (add, subtract, multiply or divide) and performs the operation on the two numbers provided. For example, going to /add/1/2 should render 3.

  get '/:operation/:number1/:number2' do
    op = params[:operation]
    n1 = params[:number1].to_i
    n2 = params[:number2].to_i

    if op == 'add'
      return (n1 + n2).to_s
    elsif op == 'subtract'
      return (n1 - n2).to_s
    elsif op == 'multiply'
      return (n1 * n2).to_s
    elsif op == 'divide'
      return (n1 / n2).to_s
    else
      return "What is arithmetic?"
    end
  end

end
