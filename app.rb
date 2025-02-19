require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/dice/2/6") do
  first_die = rand(1..6)
	second_die = rand(1..6)
  sum = first_die + second_die
	
	@outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
	erb(:two_six)
end

get("/dice/2/10") do
  first_die = rand(1..10)
	second_die = rand(1..10)
  sum = first_die + second_die
	
	@outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  erb(:two_ten)
end

get("/dice/1/20") do
  @die = rand(1..20)
	
	@outcome = "You rolled a #{@die}."
	
	erb(:one_twenty)
end

get("/dice/5/4") do
  first_die = rand(1..4)
	second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die
	
	@outcome = "You rolled a #{first_die}, #{second_die}, #{third_die}, #{fourth_die}, and #{fifth_die} for a total of #{sum}."
	
  erb(:five_four)
end

get("/dynamic/:dice/:sides") do
   @number_dice = params.fetch("dice").to_i
   @number_sides = params.fetch("sides").to_i
   @rolls = []

   @number_dice.times do
     die = rand(1..@number_sides)

     @rolls.push(die)
   end

   erb(:flexible)
 end
