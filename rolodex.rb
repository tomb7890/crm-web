class Rolodex
  def size
    @contacts.length
  end 

  def initialize
    @contacts = []
    @id = 1000
  end
  
  def add(first_name, last_name, email, note)
    @id += 1
    c = Contact.new(@id, first_name, last_name, email, note)
    @contacts << c 
  end
  
  def modify_contact (id, first_name, last_name, email, note)
    contact = find(id)
    contact.first_name = first_name
    contact.last_name = last_name
    contact.email = email
    contact.note = note
  end
  
  def display_all_contacts
    s = ""
    @contacts.each do |c| 
      s = s + ":%18s" % c.to_s + "\n"
    end 
    s
  end
  
  def display_particular_contact id 
    c = find(id.to_i)
    if c 
      return c.to_s
    else
      return nil
    end
  end
  
  def display_info_by_attribute(keysym, val)
    # "display_info_by_attribute"
    s = ""
    results = @contacts.select { |c| val == c.send(keysym) } 
    results.each do | r | 
        s = s +  r.to_s + "\n"
    end
    s 
  end

  def set_attrib_value(id, attrib, val)
    c = find(id)
    c.send("#{attrib}=", val)
  end
  
  def delete_contact id 
    id = id.to_i
    @contacts.each do |c|
      if c.id == id 
        @contacts.delete(c)
      end
    end
    nil
  end

  def find(contact_id)
    @contacts.find { |c| contact_id == c.id }
  end
end

