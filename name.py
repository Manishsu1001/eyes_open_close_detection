import os
import random
# The name of the images was different and in order to make it to some pattern I made this function
sequence = []
di = os.listdir('Open')
sete = set()
for i in range(123):
    seq = random.randrange(0,len(di))
    while(seq in sete):
        seq = random.randrange(0,123)
    sete.add(seq)
    sequence.append(seq)
for each in range(123):
    print(di[sequence[each]])
    os.rename('Open/'+di[sequence[each]],'testing/Open/'+di[sequence[each]])
    # print('done')