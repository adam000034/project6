import java.io.*;
import java.util.Vector;

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
//------------------------------------------------------------------------------------------  
    public Object VisitCallExpression(AATCallExpression expression) {
        Vector actuals = expression.actuals();
        int decrementsize = (actuals.size() * MachineDependent.WORDSIZE);
        int offset = MachineDependent.WORDSIZE;

        //decrement SP to accommodate actuals
        emit("addi " + Register.SP() + ", " + Register.SP() + ", " + -decrementsize);
        //put actuals on stack
        for (int i = 0; i < actuals.size(); i ++) {
            //call accept on each actual to put it into ACC
            ((AATExpression) actuals.elementAt(i)).Accept(this);
            //sw $ACC, offset($SP)
            emit("sw " + Register.ACC() + ", " + offset + "(" + Register.SP() + ")");
            offset += MachineDependent.WORDSIZE;
        }
        //jal
        emit("jal " + expression.label());
        //restore SP
        emit("addi " + Register.SP() + ", " + Register.SP() + ", " + decrementsize);
        //Put return val into ACC
        emit("addi " + Register.ACC() + ", " + Register.Result() + ", 0");
        return null;
    }   /* DONE */
  
    public Object VisitMemory(AATMemory expression) {
        
        //If lhs = register and rhs = constant -->
        //      emit lw
        if (expression.mem() instanceof AATOperator) {
            AATOperator memop = (AATOperator) expression.mem();
            if (memop.operator() == AATOperator.MINUS) {        //never had AATOperator.PLUS for calls to AATMemory constructor
                if (memop.left() instanceof AATRegister && memop.right() instanceof AATConstant) {
                    AATRegister register = (AATRegister) memop.left();
                    AATConstant constant = (AATConstant) memop.right();
                    //lw    $ACC, constant(Register)
                    emit("lw " + Register.ACC() + ", " + -constant.value() + "(" + register.register() + ")");
                    //NOTE: constant must be NEGATIVE because of how we calculated offsets
                    return null;
                } else if (memop.right() instanceof AATConstant) {
                    AATConstant constant = (AATConstant) memop.right();
                    memop.left().Accept(this);
                    //lw    $ACC, constant($ACC)
                    emit("lw " + Register.ACC() + ", " + -constant.value() + "(" + Register.ACC() + ")");
                    return null;
                }
            }
            //else, fall through
        }
        
        //WORST CASE
        expression.mem().Accept(this);
        //lw    $ACC, 0($ACC)
        emit("lw " + Register.ACC() + ", 0(" + Register.ACC() + ")");       
        
        return null;
    }   /* DONE */
    
    
    public Object VisitOperator(AATOperator expression) { 
        //visit lhs
        expression.left().Accept(this);
        //expression.lhs
        boolean rightaccepted = false;
        if ((expression.operator() != AATOperator.NOT) && 
                !((expression.operator() == AATOperator.PLUS || expression.operator() == AATOperator.MINUS) && expression.right() instanceof AATConstant)) {
            rightaccepted = true;
            //place lhs into ACC    -       Could be Reg or Op (in case of Base Variable)
            emit("sw " + Register.ACC() + ", 0(" + Register.ESP() + ")");                                   //sw    $ACC, 0($ESP)   -       store ACC into top of Expression Stack
            emit("addi " + Register.ESP() + "," + Register.ESP() + ", " + (-MachineDependent.WORDSIZE));

            //store ACC to stack
            expression.right().Accept(this);
            //visit rhs
            emit("addi " + Register.ESP() + "," + Register.ESP() + ", " + (MachineDependent.WORDSIZE));
            //move val from stack to t1
            emit("lw " + Register.Tmp1() + ", " + "0(" + Register.ESP() + ")");  //lw    $t1, 4($ESP)    -       Put LHS into T1
        }
        switch (expression.operator()) {
            case AATOperator.BAD_OPERATOR:
                //bad operator
                break;
            case AATOperator.PLUS:
                //plus
                if (rightaccepted) {
                    emit("add " + Register.ACC() + ", " + Register.Tmp1() + ", " + Register.ACC());
                } else {
                    AATConstant con = (AATConstant) expression.right();
                    emit("addi " + Register.ACC() + ", " + Register.ACC() + ", " + con.value());
                }
                break;
            case AATOperator.MINUS:
                //minus
                if (rightaccepted) {
                    emit("sub " + Register.ACC() + ", " + Register.Tmp1() + ", " + Register.ACC());
                } else {
                    AATConstant con = (AATConstant) expression.right();
                    emit("subi " + Register.ACC() + ", " + Register.ACC() + ", " + con.value());
                }
                break;
            case AATOperator.MULTIPLY:
                //multiply
                emit("mult " + Register.Tmp1() + ", " + Register.ACC());
                emit("mflo " + Register.ACC());
                break;
            case AATOperator.DIVIDE:
                emit("div " + Register.ACC() + ", " + Register.Tmp1() + ", " + Register.ACC());
                emit("mflo " + Register.ACC());
                //divide
                break;
            case AATOperator.AND:
                //1 is true
                //0 is false
                //and
                //process the left side and then right side
                Label andfalselabel = new Label("andfalselabel");
                Label andendlabel = new Label("andendlabel");
                emit("beq " + Register.Tmp1() + ", " + 0 + ", " + andfalselabel);	//	beq $t1, 0, falselabel
                emit("beq " + Register.ACC() + ", " + 0 + ", " + andfalselabel);	//	beq $ACC, 0, falselabel
                emit("li " + ", " + Register.ACC() + ", " + 1);		//	addi $ACC, 1, 0
                emit("j " + andendlabel);						//	j endlabel
                emit(andfalselabel + ":");						//falselabel:
                emit("li " + ", " + Register.ACC() + ", " + 0);		//	addi $ACC, 0, 0
                emit(andendlabel + ": ");						//endlabel:
                break;
            case AATOperator.OR:
                //1 is true
                //0 is false
                //and
                //process the left side and than right side
                Label ortruelabel = new Label("ortruelabel");
                Label orendlabel = new Label("orendlabel");
                emit("beq " + Register.Tmp1() + ", " + 1 + ", " + ortruelabel);	//	beq $t1, 1, truelabel
                emit("beq " + Register.ACC() + ", " + 1 + ", " + ortruelabel);	//	beq $ACC, 1, truelabel
                emit("li " + ", " + Register.ACC() + ", " + 0);		//	addi $ACC, 0, 0
                emit("j " + orendlabel);						//	j endlabel
                emit(ortruelabel + ":");						//truelabel:
                emit("li " + ", " + Register.ACC() + ", " + 1);		//	addi $ACC, 1, 0
                emit(orendlabel + ": ");						//endlabel:
                break;
            case AATOperator.EQUAL:
                //equal
                //==
                emit("seq " + Register.ACC() + ", "+ Register.Tmp1() + ", " + Register.ACC());  //seq $ACC, $t1, $ACC
                break;
                
            case AATOperator.NOT_EQUAL:
                //not_equal
                emit("sne " + Register.ACC() + ", "+ Register.Tmp1() + ", " + Register.ACC());  //sne $ACC, $t1, $ACC
                break;
                
            case AATOperator.LESS_THAN:
                //less_than
                emit("slt " + Register.ACC() + ", "+ Register.Tmp1() + ", " + Register.ACC());	//slt $ACC, $t1, $ACC
                break;
                
            case AATOperator.LESS_THAN_EQUAL:
                //less_than_equal
                emit("sle " + Register.ACC() + ", "+ Register.Tmp1() + ", " + Register.ACC());  //sle $ACC, $t1, $ACC
                break;
                
            case AATOperator.GREATER_THAN:
                //greater_than
                emit("sgt " + Register.ACC() + ", "+ Register.Tmp1() + ", " + Register.ACC());  //sgt $ACC, $t1, $ACC
                break;
                
            case AATOperator.GREATER_THAN_EQUAL:
                //greater_than_equal
                emit("sge " + Register.ACC() + ", "+ Register.Tmp1() + ", " + Register.ACC());  //sge $ACC, $t1, $ACC
                break;
                
            case AATOperator.NOT:
                //not
                //1 is true
                //0 is false
                Label ntruelabel = new Label("ntruelabel");
                Label nendlabel = new Label("nendlabel");
                emit("beq " + Register.ACC() + ", " + 1 + ", " + ntruelabel);
                emit("li" + ", " + Register.ACC() + ", " + 1);
                emit("j " + nendlabel);
                emit(ntruelabel + ":");
                emit("li " + ", " + Register.ACC() + ", " + 0);
                emit(nendlabel + ":");
                break;
        }
        return null;
    }   //TODO: finish...

    public Object VisitRegister(AATRegister expression) {
        emit("addi " + Register.ACC() + ", " + expression.register() + ", " + 0);
        return null;
    }   /* DONE */
    
    public Object VisitCallStatement(AATCallStatement statement) {
        Vector actuals = statement.actuals();
        int decrementsize = (actuals.size() * MachineDependent.WORDSIZE);
        int offset = MachineDependent.WORDSIZE;

        //decrement SP to accomodate actuals
        emit("addi " + Register.SP() + ", " + Register.SP() + ", " + -decrementsize);
        //put actuals on stack
        for (int i = 0; i < actuals.size(); i ++) {
            //call accept on each actual to put it into ACC
            ((AATExpression) actuals.elementAt(i)).Accept(this);
            //sw $ACC, offset($SP)
            emit("sw " + Register.ACC() + ", " + offset + "(" + Register.SP() + ")");
            offset += MachineDependent.WORDSIZE;
        }
        //jal
        emit("jal " + statement.label());
        //restore SP
        emit("addi " + Register.SP() + ", " + Register.SP() + ", " + decrementsize);
        return null;
    }   /* DONE */
    
    public Object VisitConditionalJump(AATConditionalJump statement) {
        //put outcome of test into ACC
        statement.test().Accept(this);
        //check ACC, branch to label if test resolved to 1
        emit("beq " + Register.ACC() + ", " + 1 + ", " + statement.label());
        return null;
    }   /* DONE */
    
    public Object VisitEmpty(AATEmpty statement) {
        return null;
    }   /* DONE */
    
    public Object VisitJump(AATJump statement) {
	emit("j " + statement.label());
	return null;
    }   /* DONE */
    
    public Object VisitLabel(AATLabel statement) {
	emit(statement.label() + ":");
	return null;
    }   /* DONE */
    
    public Object VisitMove(AATMove statement) {
        //emit("#NEW MOVE");
        //Memory Location
        if (statement.lhs() instanceof AATMemory) {
            AATMemory lhs = (AATMemory) statement.lhs();
                        
            if (lhs.mem() instanceof AATOperator) {     //Operator in lhs
                //cast as an operator
                AATOperator lhsop = (AATOperator) lhs.mem();
                //if LHS is a register, RHS is a constant...also checked if +/-
                if (((lhsop.operator() == AATOperator.MINUS))   /*(lhsop.operator() == AATOperator.PLUS) ||*/  
                        && (lhsop.left() instanceof AATRegister) 
                        && (lhsop.right() instanceof AATConstant)) {
                    //emit("#BIGGEST MOVE TILE");
                    AATRegister reg = (AATRegister) lhsop.left();
                    AATConstant offset = (AATConstant) lhsop.right();
                    //emit code for small tile
                    if (statement.rhs() instanceof AATRegister) {
                        AATRegister regright = (AATRegister) statement.rhs();
                        emit("sw " + regright.register() + ", " + -(offset.value()) + "(" + reg.register() + ")");
                    } else {
                        statement.rhs().Accept(this);
                        emit("sw " + Register.ACC() + ", " + -(offset.value()) + "(" + reg.register() + ")");
                    }
                //when lhsop.right() IS NOT A CONSTANT?
                } else {
                    return VisitMoveMemWorstCase(lhs, statement);
                }
            //when lhs of mem is not a register
            } else {
                return VisitMoveMemWorstCase(lhs, statement);
            }
        //Register
        } else {
            /* 
             *          Move
             *      /           \
             *      Reg         Op
             *               /      \
             *              Reg    Const
             *              
             *      Code: addi reg, reg, (-const)
             */
            if (statement.rhs() instanceof AATOperator) {
                AATOperator rhsop = (AATOperator) statement.rhs();
                //if LHS is a register, RHS is a constant...also checked if +/-
                if (((rhsop.operator() == AATOperator.MINUS))   /*(lhsop.operator() == AATOperator.PLUS) ||*/  
                        && (rhsop.left() instanceof AATRegister) 
                        && (rhsop.right() instanceof AATConstant)) {
                    //emit("#DECREMENT REGISTER");
                    AATRegister reg = (AATRegister) rhsop.left();
                    AATConstant cons = (AATConstant) rhsop.right();
                    emit("addi " + reg.register() + ", " + reg.register() + ", " + -(cons.value()));
                } else {
                    return VisitMoveRegWorstCase(statement);
                }
            /* 
             *          Move
             *      /           \
             *      Reg         Reg

             *      Code: addi reg, reg, 0
             */
            } else if (statement.rhs() instanceof AATRegister) {
                //addi fp, sp, 0
                AATRegister regleft = (AATRegister) statement.lhs();
                AATRegister regright = (AATRegister) statement.rhs();
                emit("addi " + regleft.register() + ", " + regright.register() + ", 0");
            /* 
             *          Move
             *      /           \
             *      Reg        Const
             *      
             *      Code: li reg, const
             */
            } else if (statement.rhs() instanceof AATConstant) {
                AATRegister regleft = (AATRegister) statement.lhs();
                AATConstant cons = (AATConstant) statement.rhs();
                emit("li " + regleft.register() + ", " + cons.value());
            /* 
             *          Move
             *      /           \
             *      Reg         Mem
             */
            } else if (statement.rhs() instanceof AATMemory) {
                AATMemory rhs = (AATMemory) statement.rhs();
                
                if (rhs.mem() instanceof AATOperator) {     //Operator in lhs
                    //cast as an operator
                    AATOperator rhsop = (AATOperator) rhs.mem();
                    //if LHS is a register, RHS is a constant...also checked if +/-
                    if (((rhsop.operator() == AATOperator.MINUS))   /*(lhsop.operator() == AATOperator.PLUS) ||*/  
                            && (rhsop.left() instanceof AATRegister) 
                            && (rhsop.right() instanceof AATConstant)) {
                        //emit("#BIGGEST MOVE TILE");
                        AATRegister reg = (AATRegister) rhsop.left();
                        AATConstant offset = (AATConstant) rhsop.right();
                        //emit code for small tile
                        if (statement.lhs() instanceof AATRegister) {
                            AATRegister regleft = (AATRegister) statement.lhs();
                            emit("lw " + regleft.register() + ", " + -(offset.value()) + "(" + reg.register() + ")");
                        } else {
                            statement.lhs().Accept(this);
                            emit("lw " + Register.ACC() + ", " + -(offset.value()) + "(" + reg.register() + ")");
                        }
                    //when rhsop.right() IS NOT A CONSTANT?
                    } else {
                        return VisitMoveRegWorstCase(statement);
                    }
                //when lhs of mem is not a register
                } else {
                    return VisitMoveRegWorstCase(statement);
                }
            /* 
             *          Move
             *      /           \
             *      Reg         ?
             */
            } else {
                return VisitMoveRegWorstCase(statement);
            }
        }
        return null;             
    }   /* DONE */
    
    public Object VisitMoveMemWorstCase(AATMemory lhs, AATMove statement) {
        lhs.mem().Accept(this); //outputs code that when executed, will put value of memaddr into ACC
        emit("sw " + Register.ACC() + ", 0(" + Register.ESP() + ")");   //Save ACC onto Stack
        emit("addi " + Register.ESP() + "," + Register.ESP() + ", " + (-MachineDependent.WORDSIZE));
        statement.rhs().Accept(this);   //puts into ACC
        emit("lw " + Register.Tmp1() + ", " + MachineDependent.WORDSIZE + "(" + Register.ESP() + ")");  //emit("lw...)(load value into t1 - lw $t1, ($ESP)
        emit("addi " + Register.ESP() + "," + Register.ESP() + ", " + MachineDependent.WORDSIZE);   //emit - move esp back up
        emit ("sw " + Register.ACC() + ", 0(" + Register.Tmp1() + ")");        //store ACC into addr at t1
        return null;
    }
    
    public Object VisitMoveRegWorstCase(AATMove statement) {
        AATRegister lhs = (AATRegister) statement.lhs();
        statement.rhs().Accept(this);
        emit("addi " + lhs.register() + ", " + Register.ACC() +", 0");
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
        statement.left().Accept(this);
        statement.right().Accept(this);
        return null;
    }   /* DONE */
    
    public Object VisitConstant(AATConstant expression) {
        emit ("li " + ", " + Register.ACC() + ", " + expression.value());
        //addi $ACC, 0, value
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

