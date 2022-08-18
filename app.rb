class Hangman
    def initialize
        @letters = ('a'..'z').to_a
        @word = words.sample
        @lives = 7
    end

    def words
        [
            ["nairobi", "City of cool water"],
            ["somalia", "Horn of Africa"],
            ["paris", "City of love"],
            ["eldoret", "City of Champions"],
            ["vegas", "Sin city"],
            
        ]
    end

    def print_teaser
        word_teaser = ""

        @word.first.size.times do
            word_teaser += "_ "
        end

        puts word_teaser
    end

    def make_guess
        if @lives > 0
            puts "Enter a letter"
            guess = gets.chomp
            #check if the user input matcheds the word.This will reaturn a boolean

            good_guess = @word.first.include? guess
            #checks if its true
            if good_guess
                puts "Good guess!"
            else
                @lives -= 1
                puts "Sorry.Please try again.You have #{@lives} left."
                make_guess
            end
        else 
            puts "Game over!"
        end
    end


    #This method will begin the game
    def begin
        puts "New game started .... your word is #{ @word.first.size } characters long"
        print_teaser
        puts "Clue: #{@word.last}"
       
        make_guess
       
    end

end

game = Hangman.new
game.begin