class Customer

    #changing getters
    # attr_reader :id, :name, :address
    # attr_writer :id, :name, :address

    attr_accessor :id, :name, :address
    
    def initialize(id=1, name="Ahmad", address="Alex")
        @id = id
        @name = name
        @address = address
    end

    #getters
    # def id
    #     return @id
    # end

    # def name
    #     return @name
    # end

    # def address
    #     return @address
    # end

    #setters
    # def id=(id)
    #     @id = id
    # end

    # def name(name)
    #     @name = name
    # end

    # def address(address)
    #     @address = address
    # end
end

customer1 = Customer.new(2, "Mohammed", "Cairo")
puts customer1.id
customer1.id=5
puts customer1.id
