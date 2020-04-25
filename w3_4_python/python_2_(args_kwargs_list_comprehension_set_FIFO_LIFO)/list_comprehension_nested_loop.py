chaine1 = "abc"
chaine2 = "de"

# for x in chaine1:
# 	for y in chaine2:
# 		x+y

concat = [ x+y for x in chaine1 for y in chaine2]
print(concat)