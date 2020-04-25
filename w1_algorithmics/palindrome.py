word = "non"

for i in range (0,len(word)//2):
	print word[i]
	
for i in range (0,len(word)//2):
	if word[i] == word[len(word)-1-i]:
		print("palindrome")
	