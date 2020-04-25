X = {'a', 'b', 'c', 'd'}
Y = {'s','b', 'd'}

print('X: ', X)
print('Y: ', Y)

print('c' in X)

print({'c'}.issubset(X))
print({'a'}.issubset(Y))

print(X-Y)
print(Y-X)

print(X | Y)

print(X & Y)