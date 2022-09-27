class Person
  def initialize(name = "Unknown", parent_permission = true, age )
    @id = rand(1...555)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def getId 
    p @id
  end
  def getName
    p @name
  end
  def getAge
    p @age
  end
  def getPersmission
    p @parent_permission
  end

  def setName(newName)
    @name = newName
  end

  def setAge(newAge)
    @age = newAge
  end

  def can_use_services?
    p is_of_age? || @parent_permission ? true : false
  end

    private
    def is_of_age?
      return true if @age > 18
    end
    
end
