import numpy as np

F = np.array([[1]])  # Assuming no change in state


Q = np.array([[0.01]])  # Adjust the value as per your system dynamics and noise characteristics


R = np.eye(47)*5 # Covariance of the third observation

x0 = np.array([[0.5]])  # Initial state estimates

# learned loadings for PANP
H1 = np.array([[2.05169581],
              [2.40295494],
              [2.0302588 ]])

# Estimated H, via JAGS on 29/4/24 by @Dennis
H = np.array([1.0000000,
              0.3443420,
              0.3131389,
              0.3570268,
              0.3432308,
              0.2720027,
              0.3348367,
              0.3351161,
              0.3329577,
              0.3451589,
              0.3303322,
              0.3140430,
              0.3003346,
              0.3890764,
              0.3815680,
              0.3529815,
              0.3192123,
              0.3094889,
              0.3219098,
              0.3096533,
              0.3187339,
              0.2988746,
              0.3042445,
              0.4634985,
              0.3101772,
              0.2823444,
              0.4130991,
              0.5604549,
              0.3992033,
              0.4714545,
              0.4751539,
              0.3637606,
              0.4584629,
              0.5394988,
              0.4940929,
              0.3974331,
              0.5585523,
              17.6318806,
              0.6248371,
              0.2895668,
              0.4332621,
              0.5071943,
              0.3624109,
              0.4509599,
              0.3593122,
              0.5472788,
              0.3080253]).reshape((47,1))