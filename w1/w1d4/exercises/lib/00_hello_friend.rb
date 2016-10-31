class Friend
  def greeting(name=nil)
    if name != nil
      p "Hello, #{name}!"
    else
      p "Hello!"
    end
  end
end
