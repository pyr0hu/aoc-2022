# frozen_string_literal: true

class Match
  WIN_SCORE = 6
  DRAW_SCORE = 3
  LOSE_SCORE = 0

  ROCK_VALUES = %w[A X]
  PAPER_VALUES = %w[B Y]
  SCISSOR_VALUES = %w[C Z]

  def initialize(match)
    @choice_scores = {:rock => 1, :paper => 2, :scissor => 3}

    @score_map = {
      :rock => {
        :scissor => WIN_SCORE, :rock => DRAW_SCORE, :paper => LOSE_SCORE
      },
      :paper => {
        :rock => WIN_SCORE, :paper => DRAW_SCORE, :scissor => LOSE_SCORE
      },
      :scissor => {
        :paper => WIN_SCORE, :scissor => DRAW_SCORE, :rock => LOSE_SCORE
      },
    }

    @choices = match.split
    @opponent_choice = self.input_to_choice(@choices[0])
    @my_choice = self.input_to_choice(@choices[1])
  end

  def total
    self.my_score + self.result_score
  end

  def guess_choice
    # eh, dislike
    score_to_find = case @choices[1]
                    when 'X' then WIN_SCORE
                    when 'Y' then DRAW_SCORE
                    else LOSE_SCORE
                    end

    @my_choice = @score_map[@opponent_choice].key(score_to_find)

    self
  end

  def my_score
    @choice_scores[@my_choice]
  end

  def result_score
    @score_map[@my_choice][@opponent_choice]
  end

  def input_to_choice(input)
    case input
    when *ROCK_VALUES then :rock
    when *PAPER_VALUES then :paper
    when *SCISSOR_VALUES then :scissor
    end
  end
end
