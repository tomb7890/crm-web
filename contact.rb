class Contact

  attr_accessor :id, :first_name, :last_name, :email, :note

  def initialize(id, first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = id 
  end

  def to_s
    "#{@first_name} #{@last_name} #{@email} #{@note} #{id}"
  end
end
