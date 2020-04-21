require 'models/class_room'


describe ClassRoom.new 'tsofit' do
  it { is_expected.to have_attributes(students:'tsofit') }

end


describe ClassRoom do

  before(:all) do
    puts "This happaed before all test"
  end

  def student_with_name(full_name) #helpers
    @s= double('student') #mock
    allow(@s).to receive(:name) {full_name}
    return @s
  end

  before(:each) do
    puts "This happend before each test"
    @s1= student_with_name('john gfd')
    @s2= student_with_name('gal gfd')

  end
  it 'should return metadata of examples' do |example|
=begin
      example.metadata.each do |k,v|
      puts "#{k}: #{v}"
      end
=end

    puts "metadata: #{example.metadata[:file_path]}"
  end
  it 'should student_names methods work correctly' ,:names=>true do
    class_room=ClassRoom.new [@s1,@s2]
    expect(class_room.student_names).to eq('john gfd,gal gfd')
  end

  it 'should return the number of students in class',:counts=>true do
    @s3= student_with_name('gil gfd')
    class_room=ClassRoom.new [@s1,@s2,@s3]
    expect(class_room.number_of_students).to eq 3
  end

  after(:all) do
    puts "This happend after all test "
  end
end
