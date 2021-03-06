#!/usr/bin/env ruby

class Organism

    attr_accessor :live

    def initialize(name = '')
        @name = name
        @live = true
        puts "new organism!"
    end

    def die()
        @live = false
    end
end

class Animal < Organism

    def Animal.reproduce(male_parent, female_parent)
        if (male_parent.sex != "male" || female_parent.sex != "female")
            puts "error: must have a male and female parent"
        elsif (!male_parent.live) || (!female_parent.live)
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

class Human < Animal

    def initialize(*args)
        super(*args)
        @possessions = {}
    end

    def acquire(thing)
        @possessions[thing] = true
    end

    def surrender(thing)
        @possessions.delete(thing)
    end

    def die()

        @possessions.each do |item|
            @offspring[0].acquire(item)
            surrender(item)
        end

        super

    end

end

bob = Human.new("bob", "male")
mary = Human.new("mary", "female")

bob.acquire("house")
bob.acquire("car")
#puts bob.inspect

chuck = Human.reproduce(bob, mary)
bob.die

#puts bob.inspect
#puts mary.inspect
puts chuck.inspect
