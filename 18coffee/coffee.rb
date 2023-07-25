class CoffeeMachine
  # ...

  def make_coffee(ingredients)
    ingredients = { coffee: 0, water: 0, milk: 0 }.merge(ingredients)

    check_availability(ingredients) { |availability| return unless availability }
    check_water_or_milk(ingredients) { |present| return unless present }

    @coffee -= ingredients[:coffee]
    @water -= ingredients[:water]
    @milk -= ingredients[:milk]
    @coffee_count += 1
    puts "Your coffee is ready!"
    puts "Machine needs maintenance!" if coffee_count >= 500
  end

  # ...

  private

  def check_availability(ingredients)
    availability = true

    if ingredients[:coffee] > coffee
      availability = false
      puts "Not enough coffee"
    end

    if ingredients[:water] > water
      availability = false
      puts "Not enough water"
    end

    if ingredients[:milk] > milk
      availability = false
      puts "Not enough milk"
    end

    yield(availability)
  end

  def check_water_or_milk(ingredients)
    if ingredients[:water].zero? && ingredients[:milk].zero?
      puts "You need to specify water and/or milk"
      yield(false)
    end

    yield(true)
  end
end