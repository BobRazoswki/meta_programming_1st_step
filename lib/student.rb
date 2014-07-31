class Student

	def initialize
		@awards = []
	end

	def method_missing(name, *args)
		if name.to_s.match(/^has_.+?\?$/)
			create_method(name)
		else
			super
		end
	end

	def create_method(name)
		self.class.send(:define_method, name) { false }
		self.send(name)
	end


	def award badge
		@awards << badge
		self.class.send(:define_method, "has_#{badge}?") { true }
	end



end


=begin
	
class Student

def initialize
		award_no
end

def has_unixoid?
	@award 
end

def award_yes
	@award = true 
end

def award_no
	@award = false
end

def award(which)
	@award = which
end

end
	
=end