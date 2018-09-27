# Calculating parameters for experiment
## Coagulant
```python
from aide_design.play import *
C_Super = 70*u.g/u.L
m_Need = 1*u.mg
V_Need = m_Need/C_Super
V_Need.to(u.uL)
```
