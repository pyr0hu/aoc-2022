# frozen_string_literal: true

class Match
  def initialize(match_up)
    @choice_scores = {:rock => 1, :paper => 2, :scissor => 3}
    @opponent_choice_map = {'A' => :rock, 'B' => :paper, 'C' => :scissor}
    @my_choice_map = {'X' => :rock, 'Y' => :paper, 'Z' => :scissor}
    @score_map = {
      :rock => {
        :scissor => 6, :rock => 3, :paper => 0
      },
      :paper => {
        :rock => 6, :paper => 3, :scissor => 0
      },
      :scissor => {
        :paper => 6, :scissor => 3, :rock => 0
      },
    }

    choices = match_up.split
    @opponent_choice_str = choices[0]
    @my_choice_str = choices[1]
    @opponent_choice = @opponent_choice_map[@opponent_choice_str]
    @my_choice = @my_choice_map[@my_choice_str]
  end

  def total
    @choice_scores[@my_choice] + @score_map[@my_choice][@opponent_choice]
  end

  def guess_choice
    score_to_find = case @my_choice_str
                    when 'X' then 6
                    when 'Y' then 3
                    else 0
                    end

    @my_choice =@score_map[@opponent_choice].key(score_to_find)

    self
  end
end
