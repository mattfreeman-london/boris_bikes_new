class Secret_Diary

@status = 'locked'

  def add_entry
    if @status == 'unlocked'
      "You can write an entry."
    else
      "The diary is locked."
    end
  end

  def get_entries
    if @status == 'unlocked'
      "Here are your entries."
    else
      "The diary is locked."
    end
  end

  def unlock
    @status = 'unlocked'
    "The diary is now unlocked."
  end

  def lock
    @status = 'locked'
    "The diary is locked."
  end

end
