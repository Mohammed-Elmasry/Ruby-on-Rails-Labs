#global variables
$global_var = [10]
$global_var.freeze

class Class1 
    def print_global
        $global_var << 5
        puts "global_var is #{$global_var}"
    end
end

class Class2 
    def print_global 
        $global_var << 5
        puts "global_var is #{$global_var}"
    end
end

class1 = Class1.new
class1.print_global

class2 = Class2.new
class2.print_global
