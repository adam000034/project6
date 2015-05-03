import java.io.*;

class CodeGenerator implements AATVisitor { 
    
    public CodeGenerator(String output_filename) {
	try {
	    output = new PrintWriter(new FileOutputStream(output_filename));
	} catch (IOException e) {
	    System.out.println("Could not open file "+output_filename+" for writing.");
	}
	/*  Feel free to add code here, if you want to */
	EmitSetupCode();
    }
  
    public Object VisitCallExpression(AATCallExpression expression) {
        return null;
    }
  
    public Object VisitMemory(AATMemory expression) {
        
        //If lhs = register and rhs = constant -->
        //      emit lw
        AATOperator memop = (AATOperator) expression.mem();
        
        memop.left().Accept(this);                                                                      //place lhs into ACC    -       Could be Reg or Op (in case of Base Variable)
        emit("sw " + Register.ACC() + ", 0(" + Register.ESP() + ")");                                   //sw    $ACC, 0($ESP)   -       store ACC into top of Expression Stack
        emit("addi " + Register.ESP() + ", " + Register.ESP() + ", "+ (-MachineDependent.WORDSIZE));    //addi  $ESP, $ESP, -4  -       Decrement ESP
        
        memop.right().Accept(this);                                                                     //place rhs into ACC        
        emit("lw " + Register.Tmp1() + ", " + MachineDependent.WORDSIZE + "(" + Register.ESP() + ")");  //lw    $t1, 4($ESP)    -       Put LHS into T1
        emit("addi " + Register.ESP() + ", " + Register.ESP() + ", " + MachineDependent.WORDSIZE);      //addi  $ESP, $ESP, 4   -       Increment ESP
        
        if (memop.operator() == AATOperator.MINUS) {
            emit("sub " + Register.ACC() + ", " + Register.Tmp1() + ", " + Register.ACC());             //sub   $ACC, $t1, $ACC -       Put LHS Minus Offset into ACC
        } else if (memop.operator() == AATOperator.PLUS){
            emit("add " + Register.ACC() + ", " + Register.Tmp1() + ", " + Register.ACC());             //add   $ACC, $t1, $ACC -       Put LHS Plus Offset into ACC
        }
        
        emit("lw " + Register.ACC() + ", " + 0 + "(" + Register.ACC() + ")");                           //lw    $ACC, 0($ACC)   -       Put value of LHS+/-Offset into ACC 
        
        //I THINK WE SHOULD HOLD OFF ON "ARBITRARILY" COMPLICATED MEM TREES FOR NOW BECAUSE WE NEVER CREATED ANY.
        
        /*else {        //Right hand side is not a constant
            //Else (arbitrarily complicated) -->
            //      statement.accept(this);
            //      emit lw $acc, 0 ($acc)
            emit("lw " + Register.ACC() + ", " + 0 + "(" + Register.ACC() + ")");
        }*/
        
        
        return null;
    }
    
    
    public Object VisitOperator(AATOperator expression) { 
        //visit lhs
        //expression.lhs
        //store ACC to stack
        //visit rhs
        //move val from stack to t1
        
        //switch statement on operator
            //emit accordingly
            //+
            //  add t1 to ACC and put into ACC
            //==
            //  create labels
            //  beq t1, ACC, true label
            //  mov 0 into ACC
            //  jump end
            //  true label = move 1 into ACC
            //  end label
        return null;
    }

    public Object VisitRegister(AATRegister expression) {
        
        return null;
    }
    
    public Object VisitCallStatement(AATCallStatement statement) {
        return null;
    }
    public Object VisitConditionalJump(AATConditionalJump statement) {
        return null;
    }
    
    public Object VisitEmpty(AATEmpty statement) {
        return null;
        //DONE
    }
    public Object VisitJump(AATJump statement) {
	emit("j " + statement.label());
	return null;
    }
    public Object VisitLabel(AATLabel statement) {
	emit(statement.label() + ":");
	return null;
    }
    public Object VisitMove(AATMove statement) {
        //Memory Location
        if (statement.lhs() instanceof AATMemory) {
            AATMemory lhs = (AATMemory) statement.lhs();
            
            //I'M WONDERING IF WE EVEN NEED THIS FIRST IF-CLAUSE, BECUASE WON'T LHS.MEM().ACCEPT(THIS) AUTOMATICALLY PUT THE LHS MEM INTO ACC regardless if it's op or direct register??
            
            if (lhs.mem() instanceof AATOperator) {     //Operator in lhs
                //cast as an operator
                AATOperator lhsop = (AATOperator) lhs.mem();
                //if LHS is a register, RHS is a constant...also checked if +/-
                if (((lhsop.operator() == AATOperator.PLUS) || (lhsop.operator() == AATOperator.MINUS)) 
                        && (lhsop.left() instanceof AATRegister) 
                        && (lhsop.right() instanceof AATConstant)) {
                    //AATRegister reg
                    AATConstant offset = (AATConstant) lhsop.right();
                    //TODO: FINISH THIS
                    //emit code for small tile
                    //statement.rhs().Accept(this);
                    //emit("sw " + Register.ACC() + offset + "(" + Register + ")";
                }
            } else {
                lhs.mem().Accept(this); //outputs code that when executed, will put value of memaddr into ACC
                emit("sw " + Register.ACC() + ", 0(" + Register.ESP() + ")");   //Save ACC onto Stack
                emit("addi " + Register.ESP() + "," + Register.ESP() + ", " + (-MachineDependent.WORDSIZE));
                statement.rhs().Accept(this);   //puts into ACC
                emit("lw " + Register.Tmp1() + ", " + MachineDependent.WORDSIZE + "(" + Register.ESP() + ")");  //emit("lw...)(load value into t1 - lw $t1, ($ESP)
                emit("addi " + Register.ESP() + "," + Register.ESP() + ", " + MachineDependent.WORDSIZE);   //emit - move esp back up
                emit ("sw " + Register.ACC() + ", 0(" + Register.Tmp1() + ")");        //store ACC into addr at t1
            }
        //Register
        }  else {
            AATRegister lhs = (AATRegister) statement.lhs();
            statement.rhs().Accept(this);
            emit("addi " + lhs.register() + "," + Register.ACC() +",0");
        }
        return null;             
    }
    
    
    public Object VisitReturn(AATReturn statement) {
	emit("jr " + Register.ReturnAddr());
	return null;
    }   /* DONE */

    public Object VisitHalt(AATHalt halt) {
	/* Don't need to implement halt -- you can leave 
	   this as it is, if you like */
        return null;
    }   /* DONE */
    
    public Object VisitSequential(AATSequential statement) {
        return null;
    }
    
    public Object VisitConstant(AATConstant expression) {
        emit ("sw " + expression.value() + ", 0(" + Register.ACC() + ")");
        return null;
    }   /* DONE */
//------------------------------------------------------------------------------------------
    private void emit(String assem) {
	assem = assem.trim();
	if (assem.charAt(assem.length()-1) == ':') 
      output.println(assem);
	else
	    output.println("\t" + assem);
    }
    
    public void GenerateLibrary() {
	emit("Print:");
	emit("lw $a0, 4(" + Register.SP() + ")");
	emit("li $v0, 1");
	emit("syscall");
	emit("li $v0,4");
	emit("la $a0, sp");
	emit("syscall");
	emit("jr $ra");
	emit("Println:");
	emit("li $v0,4");
	emit("la $a0, cr");
	emit("syscall");
	emit("jr $ra");
	emit("Read:");
	emit("li $v0,5");
	emit("syscall");
	emit("jr $ra");
	emit("allocate:");
	emit("la " + Register.Tmp1() + ", HEAPPTR");
	emit("lw " + Register.Result() + ",0(" + Register.Tmp1() + ")");
	emit("lw " + Register.Tmp2() + ", 4(" + Register.SP() + ")");
	emit("sub " + Register.Tmp2() + "," + Register.Result() + "," + Register.Tmp2());
	emit("sw " + Register.Tmp2() + ",0(" + Register.Tmp1() + ")");
	emit("jr $ra");
	emit(".data");
	emit("cr:");
	emit(".asciiz \"\\n\"");
	emit("sp:");
	emit(".asciiz \" \"");
        emit("HEAPPTR:");
	emit(".word 0");
	output.flush();
    }
    
    private void EmitSetupCode() {
	emit(".globl main");
	emit("main:");
	emit("addi " + Register.ESP() + "," + Register.SP() + ",0");
	emit("addi " + Register.SP() + "," + Register.SP() + "," + 
	     - MachineDependent.WORDSIZE * STACKSIZE);
	emit("addi " + Register.Tmp1() + "," + Register.SP() + ",0");
	emit("addi " + Register.Tmp1() + "," + Register.Tmp1() + "," + 
	     - MachineDependent.WORDSIZE * STACKSIZE);
	emit("la " + Register.Tmp2() + ", HEAPPTR");
	emit("sw " + Register.Tmp1() + ",0(" + Register.Tmp2() + ")");
        emit("sw " + Register.ReturnAddr() + "," + MachineDependent.WORDSIZE  + "("+ Register.SP() + ")"); 
 	emit("jal main1");
	emit("li $v0, 10");
        emit("syscall");
    }
    
    private final int STACKSIZE = 1000;
    private PrintWriter output;
    /* Feel Free to add more instance variables, if you like */
}

