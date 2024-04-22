import numpy as np

F = np.array([[1]])  # Assuming no change in state


Q = np.array([[0.01]])  # Adjust the value as per your system dynamics and noise characteristics


R = np.eye(47)*5 # Covariance of the third observation

x0 = np.array([[0.5]])  # Initial state estimates

# learned loadings for PANP
H1 = np.array([[2.05169581],
              [2.40295494],
              [2.0302588 ]])

# Placeholder loadings for full model
H = np.random.normal(3,7,47).reshape((47,1))
H[23] = 0.04