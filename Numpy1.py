#numpy - Numerical python library, it provides more speed,fewer loops, clearer code
#better quality. It is used for operations on multidimensionaly array. Majorly
#used in the field of data science

import numpy as np

digits = np.array([
    [1,2,3],
    [4,5,6],
    [7,8,9]
    ])

print(digits)

print(digits.shape) #size of an array
row_vector = digits[:,np.newaxis]
print("digits", row_vector)