RSpec.describe Post, type: :model do
  subject { Post.create(title: 'Hello', text: 'Hello World!') }

  before(:example) { subject.save }

  describe 'Title should be' do
    it 'present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'less than or equal 250 characters' do
      subject.title = 't' * 251
      expect(subject).to_not be_valid
    end
  end

  describe 'Comments_counter should be' do
    it 'present' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'integer' do
      subject.comments_counter = 'eight'
      expect(subject).to_not be_valid
    end

    it 'greater than or equal to 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'Likes_counter should be' do
    it 'present' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end

    it 'integer' do
      subject.likes_counter = 'eight'
      expect(subject).to_not be_valid
    end

    it 'greater than or equal to 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end
end
