# This is the class BoarCase who define and update case's game
class BoardCase
    attr_accessor :caze
    attr_reader :nb_caze
    # Initialization of caze game
    def initialize(caze, nb_caze)
        @caze = caze
        @nb_caze = nb_caze
    end

    # set the value's case to X
    def set_caze_to_X
        return @caze = "[X]"
    end

    #set the value's case to O
    def set_caze_to_O
        return @caze = "[O]"
    end

    def set_caze_to_white
        return @caze = "[ ]"
    end
end