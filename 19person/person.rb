class Person
  def initialize(name)
    @name = name
    @hunger = 80
    @sleepiness = 10
    @stamina = 80
  end

  def status
    puts "My name is #{@name}, this is my status:"
    puts "Hunger: #{@hunger}"
    puts "Sleepiness: #{@sleepiness}"
    puts "Stamina: #{@stamina}"

    puts "I am very hungry" if @hunger == 100
    puts "I am satiated" if @hunger.zero?
    puts "I need to sleep" if @sleepiness == 100
    puts "I am totally rested" if @sleepiness.zero?
    puts "I have a lot of energy" if @stamina == 100
    puts "I'm tired" if @stamina.zero?
  end

  def exercise(intensity)
    puts "I have exercised at #{intensity} intensity"

    case intensity
    when "low"
      change_stamina(-10)
      change_hunger(10)
    when "medium"
      change_stamina(-25)
      change_hunger(30)
    when "high"
      change_stamina(-50)
      change_hunger(60)
    end
  end

  def sleep
    change_hunger(20)
    @sleepiness = 0
    @stamina = 100

    puts "I have slept"
  end

  def study
    change_hunger(25)
    change_sleepiness(30)
    change_stamina(-10)

    puts "I have studied"
  end

  def eat(food)
    change_hunger(food.effects[:hunger])
    change_stamina(food.effects[:stamina])
    change_sleepiness(food.effects[:sleepiness])

    puts "I have eaten"
    puts "That #{food.name} tasted #{food.taste}!"
  end

  private

  def change_stamina(change)
    if @stamina + change > 100
      @stamina = 100
    elsif (@stamina + change).negative?
      @stamina = 0
    else
      @stamina += change
    end
  end

  def change_hunger(change)
    if @hunger + change > 100
      @hunger = 100
    elsif (@hunger + change).negative?
      @hunger = 0
    else
      @hunger += change
    end
  end

  def change_sleepiness(change)
    if @sleepiness + change > 100
      @sleepiness = 100
    elsif (@sleepiness + change).negative?
      @sleepiness = 0
    else
      @sleepiness += change
    end
  end
end

class Children < Person
  def initialize(name)
    super
    @hunger = 100
  end

  def eat(food)
    change_hunger((food.effects[:hunger] * 0.8).to_i)
    change_stamina((food.effects[:stamina] * 1.2).to_i)
    change_sleepiness((food.effects[:sleepiness] * 1.1).to_i)

    puts "I have eaten"
    puts "That #{food.name} tasted #{food.taste}!"
  end
end

class Food
  attr_reader :name, :taste, :effects

  EFFECTS = {
    "dessert" => { hunger: -20, sleepiness: 0, stamina: 10 },
    "meal" => { hunger: -50, sleepiness: 10, stamina: 25 },
    "energizer" => { hunger: -10, sleepiness: -50, stamina: 50 }
  }.freeze

  def initialize(name, type, taste)
    @name = name
    @type = type
    @taste = taste
    @effects = EFFECTS[@type]
  end
end