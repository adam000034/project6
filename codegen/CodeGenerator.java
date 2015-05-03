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
        //Else (arbitrarily complicated) --> 
        //      statement.accept(this);        
        //      emit lw $acc, 0 ($acc)
        return null;
    }
    
    
    public Object VisitOperator(AATOperator expression) { 
        //visit lhs
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
        if (statement.lhs() instanceof AATMemory) {
            AATMemory lhs = (AATMemory) statement.lhs();
            if (lhs.mem() instanceof AATOperator) {
                //cast as an operator
                AATOperator lhsop = (AATOperator) lhs.mem();
                //if LHS is a register, RHS is a constant...also checked if +/-
                if (((lhsop.operator() == AATOperator.PLUS) || (lhsop.operator() == AATOperator.MINUS)) 
                        && (lhsop.left() instanceof AATRegister) 
                        && (lhsop.right() instanceof AATConstant)) {
                    //emit code for small tile
                    //statement.rhs().Accept(this);
                    //emit("sw " + Register.ACC() + offset + "(" + Register + ")";
                }
            } else {
                lhs.mem().Accept(this); //outputs code that when executed, will put value of memaddr into ACC
                emit("sw " + Register.ACC() + ", 0(" + Register.ESP() + ")");   //Save ACC onto Stack
                emit("addi " + Register.ESP() + "," + Register.ESP() + (-MachineDependent.WORDSIZE));
                statement.rhs().Accept(this);   //puts into ACC
                //emit("lw...)(load value into t1
                //emit - move esp back up
                emit ("sw " + Register.ACC() + "0(" + Register.Tmp1() + ")");        //store ACC into addr at t1
            }
        }  else {
            AATRegister lhs = (AATRegister) statement.lhs();
            statement.rhs().Accept(this);
            emit("addi " + lhs.register() + "," + Register.ACC() +",0");
            //more?
        }
        return null;             
    }
    public Object VisitReturn(AATReturn statement) {
	emit("jr " + Register.ReturnAddr());
	return null;
    }

    public Object VisitHalt(AATHalt halt) {
	/* Don't need to implement halt -- you can leave 
	   this as it is, if you like */
        return null;
    }
    public Object VisitSequential(AATSequential statement) {
        return null;
    }
    
    public Object VisitConstant(AATConstant expression) {
        return null;
    }
    
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

