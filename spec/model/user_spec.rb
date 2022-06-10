RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'Tom Sawyer',
      photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1',
      bio: 'Teacher from Mexico.'
    )
  end

  before(:example) { subject.save }

  describe 'Name should be' do
    it 'present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'greater than or equal to 3 characters' do
      subject.name = 'ab'
      expect(subject).to_not be_valid
    end

    it 'between 3 and 30 characters' do
      subject.name = 'tom'
      expect(subject).to be_valid
    end

    it 'less than or equal 30 characters' do
      subject.name = 't' * 31
      expect(subject).to_not be_valid
    end
  end

  describe 'Posts_counter should be' do
    it 'present' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end

    it 'integer' do
      subject.posts_counter = 'eight'
      expect(subject).to_not be_valid
    end

    it 'greater than or equal to 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
  end
end
