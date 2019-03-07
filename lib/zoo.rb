class Zoo
  attr_reader :cages, :employees
  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_closing_date = season_closing_date
    @season_opening_date = season_opening_date
    @cages = []
    @employees = []
    10.times do
      @cages << Cage.new
    end
  end

  def add_employee(new_employee)
    @employees << new_employee
  end

  def open?(date)
    date >= @season_opening_date && date <= @season_closing_date
  end

  def add_animal (animal)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        return animal
      end
    end
    return "Your zoo is already at capacity!"
  end

  def visit
    sumry = ""
    @employees.each do |employee|
      sumry += "#{employee.greet}\n"
    end
    @cages.each do |cage|
      if !cage.empty?
        sumry += "#{cage.animal.speak}\n"
      end
    end
    sumry
  end
end
