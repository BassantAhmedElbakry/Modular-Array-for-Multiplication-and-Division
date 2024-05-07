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
 ➔ As in block diagram used for shift right multiplication. 
<br /> 2- Division : 
<br /> Out internal= xor(xi, Quationt) +(previous output internal) +(carray out from the previous column in the same row(CR,C-1)). 
<br /> ➔ As in block diagram used for non restoring division. <br />
### So the basic cell will need: 
<br /> 1- FA 
<br /> 2- MUX (AND GATE , XOR GATE) 
<br /> 3- MUX(CR-1,C-1 ,CR,C-1) 
<br /> 4- AND 
<br /> 5- XOR 
### The General Cell:
![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/0ad3c1fa-d0e0-4f9c-b079-1e1dce545aac)
### The Full Adder:
![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/75c01612-0578-41b4-8424-809e86c2f055)
### Under our Array we have this circuit (FA_CELL) to correct the negative remainder:
![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/f0216e3e-1dee-4d40-9711-d1429a49bd98)
### Test Bench:
In Test bench we have considered all the corner cases.
![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/bf836975-4024-4863-922f-49a849d0975d)
### The Layout of the General Cell:
![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/4726a8e9-2b51-47d1-a4cd-4a7375207047)
### The Layout of the Full Adder:
![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/611d389c-68f2-4421-a890-d86f40a06082)
### The Circuit:
![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/10841a25-76c5-4010-b746-3ce22ed371de)
### Check the DRCs:
![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/9c47fcd7-7b75-41ea-bfa0-71da273d10a2)
## Tests:
### First: MUL Tests (MUL_BAR = 0):
<br />Test #1: Y = 2 → 010 & X = 5 → 0101
    <br />OUT: R = 10 → 01010
    ![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/ac2ec9fc-f528-4f49-84a4-7c0ceee738ef)
<br />Test #2: Y = 31 → 11111 & X = 31 → 11111 
        <br />OUT: R = 961 → 1111000001 
    ![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/3c1614eb-0823-40fb-9dc4-18e5a201af16)
<br />Test #3: Y = 0 → 0000 & X = 8 → 1000 → OUT: R = 0 → 0000000000 
![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/c946eb55-028d-4b3c-8c7b-39e2dce5280e)
### Second: DIV Tests (MUL_BAR = 1): 
<br />Test #1: Y = 2 → 010 & X = 5 → 0101 
         <br />Q = 0 & R = 2→ 0000000000010 
![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/73fbe821-55db-45ea-92e0-bb4bd1cb2149)
<br />Test #2: Y = 1023 → 1111111111 & X = 15 → 01111 
         <br />Q = 68 → 0001000100 & R = 3 →  00011 
![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/662743a1-f7c1-4554-8f82-855ae9412693)
<br />Test #3: Y = 88 → 0001011000 & X = 1 → 01 
         <br />Q = 88 → 0001011000 & R = 0 
![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/d8c79c49-77e4-49a2-a809-1c4bb9dbd509)
### Connect All Inputs & Outputs including VDD & GND to pads and check the DRCs:
![image](https://github.com/BassantAhmedElbakry/Modular-Array-for-Multiplication-and-Division/assets/104600321/c29e8b32-76ca-416f-8b72-238a7b4031b9)

