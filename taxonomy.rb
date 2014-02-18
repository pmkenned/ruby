#!/usr/bin/env ruby

class Organism

    attr_accessor :live

    def initialize(name = '')
        @name = name
        @live = true
        puts "new organism!"
    end
end

class Animal < Organism

    def Animal.reproduce(male_parent, female_parent)
        if (male_parent.sex != "male" or female_parent.sex != "female")
            puts "error: must have a male and female parent"
        elsif (not male_parent.live) or (not female_parent.live)
            puts "error: both parents must be alive"
        else
            offspring = Animal.new("male", male_parent, female_parent)
            male_parent.offspring << offspring
            female_parent.offspring << offspring
        end
    end

    attr_accessor :offspring, :sex

    def initialize(name, sex, male_parent = nil, female_parent = nil)
        super(name)
        @sex = sex
        @male_parent = male_parent
        @female_parent = female_parent
        @offspring = []
    end

end

class Mammal < Animal
end

class Feline < Mammal
end

class Canine < Mammal
end

class Fox < Canine
end

class Dog < Canine
end

class Cat < Feline
end

class Tiger < Feline
end

class Primate < Mammal
end

class Human < Primate

    def initialize()
        super
        @possessions = []
    end

    def acquire(thing)
        @possessions << thing
    end

end

bob = Human.new("bob", "male")
mary = Human.new("mary", "female")

bob.acquire("house")
bob.acquire("car")

#chuck = Human.reproduce(bob, mary)

puts bob.inspect
#puts mary.inspect
#puts chuck.inspect
