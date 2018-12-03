# Understanding Ching et al. (1993)

## Imports
```python
from aguaclara.play import *
```
## Constants
```python
Q = 22*u.cm**3/u.min
ID = 3*u.mm
V = (Q/(np.pi/4*ID**2)).to(u.mm/u.s)
t = 10*u.s
L = V*t
nu = 1*u.mm**2/u.s
```
## Estimate Velocity Gradient
```python
hL = pc.headloss_fric(Q,ID,L,nu,0.007)
eps = u.g_0*hL/t
G = (np.sqrt(eps/(1*u.mm**2/u.s))).to(1/u.s)
```
