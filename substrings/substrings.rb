def substrings(words, dictionary)  
  ocurrences = {}
  words_arr = words.delete("!,.'?").downcase.split(" ")
  words_arr.each do |word|
    dictionary.each do |dword|
      if word.include?(dword)
        if ocurrences[dword].nil?
          ocurrences[dword] = 1        
        else
          ocurrences[dword] += 1
        end
      end
    end
  end
  puts ocurrences
end

substrings("Howdy partner, sit down! How's it going?", ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"])