class Cipher
    attr_accessor :text,:shift

    def initialize(text,shift)
        @text = text
        @shift = shift
        @alphabet_lower = ('a'..'z').to_a
        @alphabet_capital = ('A'..'Z').to_a
    end


    def replace_letters
        index = 0
        sliced_letter = ""
        new_text = ""

        while index < @text.length
            sliced_letter = @text[index]

            if @alphabet_lower.index(sliced_letter).nil? and @alphabet_capital.index(sliced_letter)
              sliced_letter_index_in_alphabet = @alphabet_capital.index(sliced_letter)
              index_in_alphabet = sliced_letter_index_in_alphabet + @shift
              index_in_alphabet = index_in_alphabet - @alphabet_capital.length - 1 if index_in_alphabet > @alphabet_capital.length - 1
              new_text << @alphabet_capital[index_in_alphabet]
            elsif @alphabet_lower.index(sliced_letter) and @alphabet_capital.index(sliced_letter).nil?
              sliced_letter_index_in_alphabet = @alphabet_lower.index(sliced_letter)
              index_in_alphabet = sliced_letter_index_in_alphabet + @shift
              index_in_alphabet = index_in_alphabet - @alphabet_lower.length - 1 if index_in_alphabet > @alphabet_lower.length - 1
              new_text << @alphabet_lower[index_in_alphabet]
            else
              new_text << sliced_letter
            end 

            index += 1

            
        end

        puts new_text
        
    end


end

puts "Type in to encrypt"
cipher = Cipher.new(gets.chomp,5)
cipher.replace_letters