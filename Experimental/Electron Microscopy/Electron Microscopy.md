# Calculations for sample preparation
## Import packages
```python
from aide_design.play import *
from aide_design import floc_model as floc

u.define('NTU = 100/68*mg/L')
```
## Define values
```python
V = 1*u.mL # Sample volume
Inf = 900*u.NTU # Turbidity
Gamma = 0.2 # 20% coverage
C_Super = 70.28*u.g/u.L
```
## Calculate values
```python
# Clay
m_Clay = (Inf*V).to(u.mg)
m_Clay
# Coagulant
Doses = np.arange(0.1,100,0.1)*u.mg/u.L
Gammas = np.zeros(np.size(Doses))
for i in range(0,len(Doses)):
    Gammas[i] = np.abs(floc.gamma_coag(Inf,Doses[i],floc.PACl,floc.Clay,0.5*u.cm,0.1) - Gamma)
Dose = Doses[np.argmin(Gammas)]
Dose
Gammas[np.argmin(Gammas)]
V_Stock = 0.1*u.mL
C_Stock = Dose*V/V_Stock
C_Stock
V_Stock = 100*u.mL
V_Super = C_Stock*V_Stock/C_Super
V_Super.to(u.uL)
```
## Figure out pH adjustment
```python
pH_69 = 4.5
M_H = 10**(-pH_69)*u.mol/u.L
m_H = M_H*0.1*u.mL
m_H.to(u.mol)
V_NaOH = 0.1*u.mL
N_NaOH = m_H/V_NaOH
MW_NaOH = 40*u.g/u.mol
C_NaOH = N_NaOH*MW_NaOH
C_NaOH.to(u.mg/u.L)
m_NaOH = C_NaOH*1*u.L
m_NaOH.to(u.mg)
(19*u.mg/u.L/MW_NaOH).to(u.mmol/u.L)
```
