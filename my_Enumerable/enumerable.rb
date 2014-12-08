class Array
	def my_each
		i = 0
		return self unless block_given?
		while i < self.length
			yield(self[i])
			i += 1
		end
		return self
	end

	def my_each_with_index
		i = 0
		return self unless block_given?
		while i < self.length
			new = yield(self[i], i)
			i += 1
		end
		return new
	end

	[1,2,3,4,5].my_each_with_index { |n, i| puts "#{n}, #{i}" }

	def my_count
		i = 0
		count = 0
		while i < self.length
			count += 1
			i += 1
		end
		count
	end


	def my_map
    i = 0
    new_array = []
    while i < self.length
      new_array << if yield(self[i]) return true
      i += 1
      end
    new_array
    end
  end

  def my_select
  	i = 0
    new_array = []
    while i < self.length
      if yield(self[i]) == true
      	new_array << self[i]
      end
      i += 1
      end
    new_array
    end
  end

  def my_all?
  	i = 0
  	new_array = []
  	
  	while i < self.length
  		if block_given?
  			return false  unless yield(self[i])
  		end
  		i += 1 
  	end
  	true
  end

  def my_none?
  	i = 0
  	new_array = []
  	
  	while i < self.length
  		if yield(self[i]) != true
  			return true
  		else
  			return false
  		end
  		i += 1
  	end
  end

  def my_any?
  	i = 0
  	new_array = []
  	
  	while i < self.length
  		if yield(self[i]) == true
  			return false
  		else
  			return true
  		end
  		i += 1
  	end
  end

  def my_inject(num = nil)
  	accum = num.nil? ? 0 : num
    each { |i| accum =  yield(accum, i) }
    accum
    end
  end