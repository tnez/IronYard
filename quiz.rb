################################################################################
# QUIZ
################################################################################
# Generate a quiz for a user. Generate some number of questions,
# record and evaluate answers and provide feedback regarding accuracty
# upon completion.

# DEFAULTS
# --------
NUMBER_OF_QUESTIONS = 10
MAX_ANSWER_NUM = 20
MAX_ANSWER_CHAR = 'D'

# LOAD REQUIRED CODE
# ------------------
require 'unirest' # require unirest to query API


# GET_RANDOM_FACT_FROM_NUMBERS_API
# --------------------------------
# Query the numbersapi (http://numbersapi.com/) for a random fact
# about a given number.
#
# Return a hash containing :number and :fact
def get_random_fact_from_numbers_api( n )
  api_key = "CiWSEUGHC4msh82N8yx1ygcOsvwgp1mYAFGjsnzF2ynTDDlmgJ"
  url = "https://numbersapi.p.mashape.com/#{n}" +
    "/trivia?fragment=true&json=true&notfound=floor"
  response = Unirest.get( url, headers: { "X-Mashape-Key" => api_key } )
  # return the random fact
  return response.body["text"]
end


# GENERATE RANDOM NUMBERS
# -----------------------
# Generate random numbers to be used both as answers and as parameters
# for questions
def generate_random_numbers( n )
  random_numbers = []
  n.times do
    random_numbers.push( rand( MAX_ANSWER_NUM ) )
  end
  return random_numbers
end
# actually generate the random numbers
random_numbers = generate_random_numbers( NUMBER_OF_QUESTIONS )


# GENERATE POSSIBLE ANSWERS
# -------------------------
possible_answers = ('A'..MAX_ANSWER_CHAR).to_a


# GENERATE QUESTIOS
# ------------------
# generate my questions... this takes a few seconds, so first let the
# user know what is going on
puts
puts "Generating your questions (this may take a few seconds)..."
# generate the questions
questions = []
random_numbers.each do |num|
  random_fact = get_random_fact_from_numbers_api( num )
  question = "What is " + random_fact + "?"
  questions.push({ answer: num,
                   prompt: question,
                   correct_choice: possible_answers.sample
                 })
end

# create a container for results and initialize counters
answered_correctly = []
question_idx = 0

puts # add a new line for readability

# for each of our questions...
questions.each do |question|
  # generate wrong answers (wrong answers are any numbers between 0
  # and our MAX that are not equal to our actual answer
  wrong_answers = (0..MAX_ANSWER_NUM).to_a
  wrong_answers.delete(question[:answer])
  # ask the question
  puts "#{question_idx += 1}: " + question[:prompt]
  possible_answers.each do |ans|
    # propose the answer... propose a correct or incorrect answer
    # based on what index we have previously selected
    if ans == question[:correct_choice]
      # output the correct answer text
      puts "   #{ans}) #{question[:answer]}"
    else
      # choose a wrong answer, output that, and then delete it from
      # the possible wrong answers so that we don't re-use this
      # incorrect answer
      wrong_answer = wrong_answers.sample
      puts "   #{ans}) #{wrong_answer}"
      wrong_answers.delete( wrong_answer )
    end
  end
  # ask the user for their answer
  user_answer = gets.chomp.upcase
  # give the user feedback and record correctness
  if user_answer == question[:correct_choice]
    puts "You are correct!"
    answered_correctly.push(1)
  else
    puts "Wrong wrong wrong :-(  " + "The correct answer is: #{question[:answer]}"
    answered_correctly.push(0)
  end
  puts # newline for readability
end

# give results of quiz
num_correct = 0
answered_correctly.each do |correct|
  num_correct += correct
end
correct_pct = num_correct.to_f / NUMBER_OF_QUESTIONS
puts #newline for readability
puts "You got #{num_correct} out of #{NUMBER_OF_QUESTIONS} correct: " +
  "#{(correct_pct * 100).round(1)}%"
