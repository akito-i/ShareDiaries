class DiariesController < ApplicationController
  def index
    if Diary.count.zero?
      ['1st', '2nd', '3rd'].each do |title|
        Diary.create!(title: title)
      end
    end
      render json: { diaries: Diary.all.to_json }
    end

  def helth
    head :ok
  end
end

