# Modular-Array-for-Multiplication-and-Division
The objective of this project is to design down to the layout level an array multiplier / divider for unsigned binary numbers with the following parameters: 
*	 Multiplier mode: 5bit * 5bit  
*	 Divider mode: 10 bit dividend and 5 bit divisor
## The block diagram of the array multiplier / divider:
### Multiplier:
![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/a9618625-1274-420f-9500-5add36aa7201)
### Divider:
![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/34456e07-19bb-4640-af9f-5ea5dc45cb47)
### Basic concept that we use in our design: 
Multiplication and division needs full adder cell as a basic concept so their basic unit cell can be merged in one basic cell let’s define operation used FA in multiplication and division: 
<br /> 1- Multiplication : 
<br /> Out internal= xi yj +(previous output internal) +(carray out from the previous row previous column(CR-1,C-1))    
<br /> ➔ As in block diagram used for shift right multiplication. 
<br /> 2- Division : 
<br /> Out internal= xor(xi, Quationt) +(previous output internal) +(carray out from the previous column in the same row(CR,C-1)). 
<br /> ➔ As in block diagram used for non restoring division.
<br /> So the basic cell will need: 
<br /> 1- FA 
<br /> 2- MUX (AND GATE , XOR GATE) 
<br /> 3- MUX(CR-1,C-1 ,CR,C-1) 
<br /> 4- AND 
<br /> 5- XOR 
