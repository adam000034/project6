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
        expression.lhs().Accept(this);
        //expression.lhs
        //place lhs into ACC    -       Could be Reg or Op (in case of Base Variable)
        emit("sw " + Register.ACC() + ", 0(" + Register.ESP() + ")");                                   //sw    $ACC, 0($ESP)   -       store ACC into top of Expression Stack
        
        //store ACC to stack
        expression.rhs().Accept(this);
        //visit rhs
        //move val from stack to t1
        emit("lw " + Register.Tmp1() + ", " + MachineDependent.WORDSIZE + "(" + Register.ESP() + ")");  //lw    $t1, 4($ESP)    -       Put LHS into T1
        switch (expression.operator()) {
            case 1:
                //bad operator
                return null;
            case 2:
                //plus
                emit("add " + Register.ACC() + ", " + Register.Tmp1() + ", " + Register.ACC());
                
            case 3:
                //minus
                emit("sub " + Register.ACC() + ", " + Register.Tmp1() + ", " + Register.ACC());
                
            case 4:
                //multiply
                emit("mult" + Register.ACC() + ", " + Register.Tmp1() + ", " + Register.ACC());
            case 5:
                emit("div" + Register.ACC() + ", " + Register.Tmp1() + ", " + Register.ACC());
                //divide
                
            case 6:
                //1 is true
                //0 is false
               //and
               //process the left side and than right side
               Label new firstandtruelabel = new Label("firstandtruelabel");
               Label new firstandendlabel = new Label("firstandendlabel");
               Label new secondandtruelabel = new Label("secondandtruelabel");
               Label new secondandendlabel = new Label("secondandendlabel");
               emit("beq" + Register.ACC() + ", " + 1 + ", " + firstandtruelabel);
               emit("addi" + Register.ACC() + ", " + 0 + ", " + 0);
               emit("j" + firstandendlabel);
               emit(firstandtruelabel.label() + ":");
               emit("beq" + Register.ACC() + ", " + 1 + ", " + secondandtruelabel);
               emit("addi" + Register.ACC() + ", " + 0 + ", " + 0);
               emit("j" + secondandendlabel);
               emit(secondandtruelabel.label() + ":");
               emit("addi" + Register.ACC() + ", " + 0 + ", " + 1);
               emit("j" + secondandendlabel);
               emit(firstandendlabel.label());
               emit(secondandendlabel.label());
            
            case 7:
                //1 is true
                //0 is false
                //and
                //process the left side and than right side
                Label new firstortruelabel = new Label("firstortruelabel");
                Label new firstorendlabel = new Label("firstorendlabel");
                Label new secondortruelabel = new Label("secondortruelabel");
                Label new secondorendlabel = new Label("secondorendlabel");
                emit("beq" + Register.ACC() + ", " + 1 + ", " + firstortruelabel);
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 0);
                emit("beq" + Register.ACC() + ", " + 1 + ", " + secondortruelabel);
                emit("j" + firstorendlabel);
                emit(firstortruelabel.label() + ":");
                emit("beq" + Register.ACC() + ", " + 1 + ", " + secondortruelabel);
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 1);
                emit("j" + secondorendlabel);
                emit(secondortruelabel.label() + ":");
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 1);
                emit("j" + secondorendlabel);
                emit(firstorendlabel.label());
                emit(secondorendlabel.label());
                
                
            case 8:
                //equal
                //==
                Label new truelabel = new Label("truelabel");
                Label new endlabel = new Label("endlabel");
                emit("beq" + Register.Tmp1() + ", " + Register.ACC() + ", " + truelabel);
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 0);
                emit("j" + endlabel);
                emit(truelabel.label() + ":");
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 1);
                emit(endlabel.label());
                //  end label
                
                
            case 9:
                //not_equal
                Label new netruelabel = new Label("netruelabel");
                Label new neendlabel = new Label("neendlabel");
                emit("bne" + Register.Tmp1() + ", " + Register.ACC() + ", " + netruelabel);
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 0);
                emit("j" + neendlabel);
                emit(netruelabel.label() + ":");
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 1);
                emit(neendlable.label());
                
                
            case 10:
                //less_than
                Label new lttruelabel = new Label("lttruelabel");
                Label new ltendlabel = new Label("ltendlabel");
                emit("bltz" + Register.Tmp1() + ", " + Register.ACC() + ", " + lttruelabel);
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 0);
                emit("j" + ltendlabel);
                emit(lttruelabel.label() + ":");
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 1);
                emit(ltendlable.label());
                
            case 11:
                //less_than_equal
                Label new letruelabel = new Label("letruelabel");
                Label new leendlabel = new Label("leendlabel");
                emit("blez" + Register.Tmp1() + ", " + Register.ACC() + ", " + letruelabel);
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 0);
                emit("j" + leendlabel);
                emit(letruelabel.label() + ":");
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 1);
                emit(leendlable.label());
                
            case 12:
                //greater_than
                Label new gttruelabel = new Label("gttruelabel");
                Label new gtendlabel = new Label("gtendlabel");
                emit("bgtz" + Register.Tmp1() + ", " + Register.ACC() + ", " + gttruelabel);
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 0);
                emit("j" + gtendlabel);
                emit(gttruelabel.label() + ":");
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 1);
                emit(gtendlable.label());
                
            case 13:
                //greater_than_equal
                Label new getruelabel = new Label("getruelabel");
                Label new geendlabel = new Label("geendlabel");
                emit("bgez" + Register.Tmp1() + ", " + Register.ACC() + ", " + getruelabel);
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 0);
                emit("j" + geendlabel);
                emit(getruelabel.label() + ":");
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 1);
                emit(geendlable.label());
                
            case 14:
                //not
                //1 is true
                //0 is false
                Label new ntruelabel = new Label("ntruelabel");
                Label new nendlabel = new Label("nendlabel");
                emit("beq" + Register.ACC() + ", " + 1 + ", " + ntruelabel);
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 1);
                emit("j" + nendlabel);
                emit(ntruelabel.label() + ":");
                emit("addi" + Register.ACC() + ", " + 0 + ", " + 0);
                emit(nendlabel.label());
                
                     
        return null;
    }

    public Object VisitRegister(AATRegister expression) {
        emit ("addi " + Register.ACC + ", " + expression.register() + ", " + 0);
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

