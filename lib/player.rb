class Player
	attr_accessor :name, :board

	def has_board?
		!@board.nil?
	end

	def receive_shot(coordinate)
		board.shoot_at(coordinate)
	end

  def random_setup
    fleet = [Ship.aircraft_carrier, Ship.battleship, Ship.destroyer, Ship.submarine, Ship.patrol_boat ]
    until fleet.empty?
      begin
        board.place(fleet.first, get_random_coords, get_random_orientation)
        fleet.shift
      rescue
        nil
      end
    end
  end

  def get_random_coords
    letters = 'ABCDEFGHIJ'
    col = rand(10)
    row = ( rand(10) + 1)
    (letters[col] + row.to_s).to_sym
  end

  def get_random_orientation
    rand(2) == 0 ? :horizontally : :vertically
  end

end