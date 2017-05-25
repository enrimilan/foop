note
	description: "Summary description for {KEYBOARD_DEFINITION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	KEYBOARD_DEFINITION

feature {ANY} -- Keyboard mappings for players

	get_player_id_for_input(c: CHARACTER): INTEGER
		do
			if(c = 'a' or c = 's' or c = 'd' or c = 'w') then
            	Result := 1
            elseif(c = 'f' or c = 'g' or c = 'h' or c = 't') then
				Result := 2
			elseif(c = 'j' or c = 'k' or c = 'l' or c = 'i') then
				Result := 3
			else
				Result := -1
			end
		end

	translate_input_to_direction(c: CHARACTER): STRING
		do
			if(c = 'a' or c = 'f' or c = 'j') then
				Result := "LEFT"
			elseif(c = 's' or c = 'g' or c = 'k') then
				Result := "DOWN"
			elseif(c = 'w' or c = 't' or c = 'i') then
				Result := "UP"
			else
				Result := "RIGHT"
			end
		end

end
