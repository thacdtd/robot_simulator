module CustomError
  class InvalidPosition < StandardError
    def message
      'ERROR: Invalid Position. Position is out of table.'
    end
  end

  class InvalidCommand < StandardError
    def message
      'ERROR: Invalid Command. Call PLACE first.'
    end
  end

  class InvalidMove < StandardError
    def message
      'ERROR: Invalid Move. Position is out of table.'
    end
  end

  class InvalidPlaceCommand < StandardError
    def message
      'ERROR: Invalid PLACE Command.'
    end
  end

  class InvalidDirection < StandardError
    def message
      'ERROR: Invalid direction.'
    end
  end
end
