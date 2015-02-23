# Tic-tac-toe

A Tic-tac-toe game that never loses.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tic_tac_toe_mchliakh'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tic_tac_toe_mchliakh

## Usage

```ruby
class MovesController < ActionController::Base
  def make
    game = if params[:game_id]
      Game.new
    else
      Game.find(params[:game_id])
    end

    render json: TicTacToeMchliakh.move(params[:square], game.board)
  end
end
```

1. Fork it ( https://github.com/[my-github-username]/tic_tac_toe_mchliakh/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
