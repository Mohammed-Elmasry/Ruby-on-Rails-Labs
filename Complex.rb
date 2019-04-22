#this is a definition for the complex number calculator.

class ComplexNumber
    @@stats = 
    {:plus => 0, :multiply => 0, :bulkp => 0, :bulkm => 0}
    @@stats.default = "no such key"
    
    attr_accessor :real, :imaginary

    def initialize (real=0, imaginary=0)
        @real = real
        @imaginary = imaginary
    end
    
    def +(cn2)
        @@stats[:plus] += 1
        newComplex = ComplexNumber.new
        newComplex.real = self.real + cn2.real
        newComplex.imaginary  = self.imaginary + cn2.imaginary
        return newComplex
    end 

    def *(cn2);
        @@stats[:multiply] += 1
        newComplex = ComplexNumber.new(0,0)
        newComplex.real = self.real * cn2.real
        newComplex.imaginary = self.imaginary * cn2.imaginary
        return newComplex
    end

    def self.bulk_add(complexArr);
        @@stats[:bulkp] += 1
        newComplex = ComplexNumber.new(0,0)
        complexArr.each do |num| 
            newComplex = newComplex + num
        end
        return newComplex
    end

    def self.bulk_multiply(complexArr);
        @@stats[:bulkm] += 1
        newComplex = ComplexNumber.new(1,1)
        complexArr.each do |num|
            newComplex = newComplex * num
        end
        return newComplex
    end     

    def self.get_stats;
        puts (@@stats)
    end 
end 

def printComplex(cn)
    puts(cn.real.to_s + " + " + cn.imaginary.to_s + "i")
end

#testing section

complex1 = ComplexNumber.new(3,2)
complex2 = ComplexNumber.new(2,4)
complex3 = ComplexNumber.new(4,3)
printComplex(complex1 + complex2)
printComplex(complex1 * complex2)
printComplex(ComplexNumber.bulk_add([complex1,complex2, complex3]))
printComplex(ComplexNumber.bulk_multiply([complex1, complex2]))
printComplex(ComplexNumber.bulk_multiply([complex1,complex2, complex3]))
ComplexNumber.get_stats