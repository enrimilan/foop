note
	description: "Summary description for {SNAKE_ALGO}."
	author: "georg aschl"
	date: "$Date$"
	revision: "$Revision$"

class
	SNAKE_ALGO

create
	make

feature {NONE} -- Private variables
	game: GAME
	dir: DIRECTION
	constants: CONSTANTS
	player_id: INTEGER
feature {ANY} -- public variables	
	snake: SNAKE

feature {ANY} -- Initialization and main entry point

	make(game_: GAME)
		require
			game_.has_finished = false
		local
			snake_impl:SNAKE_IMPL
		do
			game := game_
			player_id:=-1
			create constants
			create dir
			--dummy
			create snake_impl.make (-1, '-')
			snake:=snake_impl
		end

feature {ANY} -- Public features

	get_next_direction:STRING
		require
		local
			next_dir:STRING
		do
			next_dir:=direction_to_food
			--if snake len > 1, cannot turn, check this
			if snake.get_points.count>1 then
				next_dir := alter_dir_if_snake_long(next_dir)
			end
			Result:=next_dir
		end

	alter_dir_if_snake_long(next_dir:STRING):STRING
		do
				Result:=next_dir
			if 	next_dir.is_equal(dir.up) and snake.get_direction.is_equal (dir.down) or
			 	next_dir.is_equal(dir.down) and snake.get_direction.is_equal (dir.up)
			then
				Result:=dir.left
			end
			if 	next_dir.is_equal(dir.left) and snake.get_direction.is_equal (dir.right) or
			 	next_dir.is_equal(dir.right) and snake.get_direction.is_equal (dir.left)
			then
				Result:=dir.up
			end

		end



	direction_to_food:STRING
		require
			snake.get_id/=-1
		local
			player_x:INTEGER
			player_y:INTEGER
			food_x:INTEGER
			food_y:INTEGER

		do
			Result:="none"
			if snake.is_playing then
				player_x := snake.get_head.get_x
				player_y := snake.get_head.get_y
				food_x := game.get_state.get_food.get_x
				food_y := game.get_state.get_food.get_y

				if player_x = food_x then
					--on same x level
					if player_y < food_y then
						Result:=dir.down
					else
						Result:=dir.up
					end
				end

				if player_y = food_y then
					--on same y level
					if player_x < food_x then
						Result:=dir.right
					else
						Result:=dir.left
					end
				end
				if Result.is_equal("none") then
					if player_x < food_x then
						Result:=dir.right
					else
						Result:=dir.left
					end
				end
				if Result.is_equal("none") then
					if player_y < food_y then
						Result:=dir.down
					else
						Result:=dir.up
					end
				end
				else
					Result:=dir.right
			end
		ensure
			Result.is_equal(dir.up) or
			Result.is_equal(dir.down) or
			Result.is_equal(dir.right) or
			Result.is_equal(dir.left)
		end

	set_player_id(id:INTEGER)
		require
			id>=0
		do
			player_id := id
			snake := game.get_state.get_snakes.at (id)
		end


end
