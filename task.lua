function splitStr(self, inSplitPattern)
	local outResults = { }
	local theStart = 1
	local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
	while theSplitStart do
		table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
		theStart = theSplitEnd + 1
		theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
	end
	table.insert( outResults, string.sub( self, theStart ) )
	return outResults
end

function findSymbols(words)
    local output = ''
	for i = 1, #words do
		local currWord = words[i]
		for j = 1, currWord:len() do
			local firstPos = currWord:find(currWord:sub(j,j))            --get j char from strings
			if not currWord:find(currWord:sub(j,j), firstPos + 1) then   --if there's no more same chars
			   output = output .. currWord:sub(j,j)
			   break
			end
		end
	end
    return output
end

local input = ''
--read lines
while true do
   io.write("Input line(type Q for stop): ")
   io.flush()
   local str = io.read()
   if str == 'Q' then break end
   input = input .. str .. ' '
end

input = input:gsub('%p', ' ')             --replace punctuation chars with space
input = input:gsub('%s+', ',')            --replace all spaces with comma
local words = splitStr(input, ',')        --split string to array
local outStr = findSymbols(words)         --get string with unique chars in each word
local outChar = findSymbols({ outStr })   --get unique char from returned string
if outChar:len() == 0 then
   print('There\'s no unique char')
else
   print('\nUnique char is: ' .. outChar)
end
