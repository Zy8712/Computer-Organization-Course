;;; Nearest Size
;;; Asks for input from the user and scans array A to find the closest value

      ORG   64
A:    DD 10,1,23,3,4,15,61,72, 8,9,19,11
                            ;; promt -> t0
                            ;; inpval -> t1
PRMT: DC "Enter Size: "
      addi t0, x0, PRMT
      ecall x1, t0, 4
      ecall t1, x0, 5
                             ;; indx -> t0
                             ;; inpval -> t1
                             ;; diff -> t2
                             ;; closest -> t3
                             ;; currval -> t4
                             ;; lastindx -> t5
                             ;; mindiff -> t6
                             
      addi t0, x0, A+8 ;; indx = &A + 1
      addi t5, t0, 48 ;; lastinx = &A + 8
      ld t3, -8(t0) ;; t3 = A[0]
      sub t6, t1, t3 ;; mindiff = inpval - A[0]
      bge t6, x0, LOOP ;; if (inpval - A[0]>=0) goto POS1
      sub t6, x0, t6
  
LOOP: ld t4, 0(t0) ;; t4 = A[i]
      sub t2, t1, t4 ;; t2 = inpval - A[i]
      bge t2, x0, POS2 ;; if (inpval - A[i]>=0) goto POS2
      sub t2, x0, t2
      
POS2: bge t2, t6, CONT ;;
      addi t6, t2, 0
      addi t3, t4, 0
      
CONT: bge t0, t5, END ;; If (indx>=lastindx) goto END
      addi t0, t0, 8 ;; indx += 1
      beq x0, x0, LOOP
      
END:  ecall x0, t3, 0 ;; Print closest
      ebreak x0, x0, 0
