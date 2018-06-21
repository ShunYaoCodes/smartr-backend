require 'net/http'
require 'uri'

class Api::V1::TriviaController < ApplicationController
  def index
    @trivia = Trivium.all
    render json: @trivia
  end

  def show
  end

  def create
    uri = URI.parse("https://opentdb.com/api.php?amount=1&category=#{params['category']}&difficulty=#{params['difficulty']}&type=multiple")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
    trivia = json['results'][0]
    #byebug
    @trivia = Trivium.create(category: trivia['category'], q_type: trivia['type'], difficulty: trivia['difficulty'], question: trivia['question'], correct_answer: trivia['correct_answer'], incorrect_answers: trivia['incorrect_answers'])
    render json: @trivia
  end

  def update
  end

  def delete
  end
end
