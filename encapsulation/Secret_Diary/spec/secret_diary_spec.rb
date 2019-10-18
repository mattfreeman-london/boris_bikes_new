require 'secret_diary'

describe Secret_Diary do
  it "shows an error on add_entry if diary is locked" do
    expect(subject.add_entry).to eq 'The diary is locked.'
  end

  it "shows an error on get_entries if the diary is locked" do
    expect(subject.get_entries).to eq 'The diary is locked.'
  end

  it "shows the diary unlocked after unlock method used" do
    expect(subject.unlock).to eq 'The diary is now unlocked.'
  end

  it "shows the diary is locked after lock method used" do
    expect(subject.lock).to eq 'The diary is locked.'
  end

  it "shows you can add an entry once the diary is unlocked" do
    subject.unlock
    expect(subject.add_entry).to eq "You can write an entry."
  end

  it "shows you can get entries once the diary is unlocked" do
    subject.unlock
    expect(subject.get_entries).to eq "Here are your entries."
  end

  context "unlocking, then locking again, then adding an entry" do
    it "returns 'The diary is locked'" do
    subject.unlock
    subject.lock
    expect(subject.add_entry).to eq "The diary is locked."
    end
  end

  context "unlocking, then locking, then reading an entry" do
    it "returns 'The diary is locked'" do
    subject.unlock
    subject.lock
    expect(subject.get_entries).to eq 'The diary is locked.'
    end
  end

end
