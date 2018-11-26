########################################
# Y tuong lam bai:
# Tinh dien tich 4 tam giac: ABC, ABD, ACD, BCD
# Chung ta se Su dung cong thuc sau de tinh dien tich tam giac ABC khi co 3 diem:
# S = 1/2 | ((xB-xA)(yC-yA) - (xC-xA)(yB-yA)) |
# Tuong tu voi cac tam giac khac.
# Co hai truong hop cua tu giac la:
# - Tu giac loi:
# + Dien tich tu giac se bang dien tich cua bon tam giac cong lai chia doi.
# - Tu giac lom:
# + Se co mot tam giac lon nhat co dien tich bang dien tich cua ba tam giac nho hon cong lai
# + Se co ba truong hop dien tich cua tam giac lom.
# + Dien tich tu giac se bang dien tich cua tam giac lon nhat tru dien tich cua mot trong ba tam giac nho con lai.
########################################
	.data
heso: .float 2.0
xa: .float 0
ya: .float 0
xb: .float 0
yb: .float 0
xc: .float 0
yc: .float 0
xd: .float 0
yd: .float 0
sABC: .float 0
sABD: .float 0
sACD: .float 0
sBCD: .float 0
nhapXa: .asciiz "Nhap vao hoanh do cua diem A: "
nhapYa: .asciiz "Nhap vao tung do cua diem A: "
nhapXb: .asciiz "Nhap vao hoanh do cua diem B: "
nhapYb: .asciiz "Nhap vao tung do cua diem B: "
nhapXc: .asciiz "Nhap vao hoanh do cua diem C: "
nhapYc: .asciiz "Nhap vao tung do cua diem C: "
nhapXd: .asciiz "Nhap vao hoanh do cua diem D: "
nhapYd: .asciiz "Nhap vao tung do cua diem D: "
tamgiac: .asciiz "Tam giac "
chua: .asciiz " chua ba tam giac con lai!"
abc: .asciiz "ABC"
abd: .asciiz "ABD"
acd: .asciiz "ACD"
bcd: .asciiz "BCD"
ketqua: .asciiz "Dien tich cua tu giac ABCD la: "
tugiaclom: .asciiz "Tu giac ABCD la tu giac lom!"
tugiacloi: .asciiz "Tu giac ABCD la tu giac loi!"
bath: .asciiz "Co ba truong hop dien tich cua tu giac: "
motth: .asciiz "Co mot truong hop dien tich cua tu giac: "
th1: .asciiz "Truong hop 1: "
th2: .asciiz "Truong hop 2: "
th3: .asciiz "Truong hop 3: "
endline: .asciiz "\n"
	.text
	.globl main
main:
	li $v0, 4
	la $a0, nhapXa
	syscall
	li $v0, 6
	syscall
	swc1 $f0, xa
	
	li $v0, 4
	la $a0, nhapYa
	syscall
	li $v0, 6
	syscall
	swc1 $f0, ya
	
	li $v0, 4
	la $a0, nhapXb
	syscall
	li $v0, 6
	syscall
	swc1 $f0, xb
	
	li $v0, 4
	la $a0, nhapYb
	syscall
	li $v0, 6
	syscall
	swc1 $f0, yb
	
	li $v0, 4
	la $a0, nhapXc
	syscall
	li $v0, 6
	syscall
	swc1 $f0, xc
	
	li $v0, 4
	la $a0, nhapYc
	syscall
	li $v0, 6
	syscall
	swc1 $f0, yc
	
	li $v0, 4
	la $a0, nhapXd
	syscall
	li $v0, 6
	syscall
	swc1 $f0, xd
	
	li $v0, 4
	la $a0, nhapYd
	syscall
	li $v0, 6
	syscall
	swc1 $f0, yd
	
	# S_ABC
	lwc1 $f1, xa
	lwc1 $f2, ya
	lwc1 $f3, xb
	lwc1 $f4, yb
	lwc1 $f5, xc
	lwc1 $f6, yc
	
	#S = 1/2|((xB-xA)(yC-yA) - (xC-xA)(yB-yA))|
	
	sub.s $f7, $f3, $f1		# f7 = xB - xA
	sub.s $f8, $f6, $f2		# f8 = yC - yA
	mul.s $f9, $f7, $f8		# f9 = (xB-xA)(yC-yA)
	
	sub.s $f7, $f5, $f1		# f7 = xC - xA
	sub.s $f8, $f4, $f2		# f8 = yB - yA
	mul.s $f10, $f7, $f8	# f10 = (xC-xA)(yB-yA)
	
	c.lt.s $f9, $f10 		# if f9 < f10 then flag = true else flag = false
	bc1t cm1				# if flag = true -> cm
	bc1f mc1				# if flag = false ->mc
cm1:
	sub.s $f11, $f10, $f9	# f11 = (xC-xA)(yB-yA) - (xB-xA)(yC-yA)
	j exit1
mc1:
	sub.s $f11, $f9, $f10	# f11 = (xB-xA)(yC-yA) - (xC-xA)(yB-yA)
	j exit1
exit1:

	lwc1 $f12, heso			# load f12 = 2.0
	div.s $f11, $f11, $f12	# f11 = f11 / 2.0
	swc1 $f11, sABC
	
	
	# S_ABD
	lwc1 $f1, xa
	lwc1 $f2, ya
	lwc1 $f3, xb
	lwc1 $f4, yb
	lwc1 $f5, xd
	lwc1 $f6, yd
	
	#S = 1/2((xB-xA)(yD-yA) - (xD-xA)(yB-yA))
	
	sub.s $f7, $f3, $f1		# f7 = xB - xA
	sub.s $f8, $f6, $f2		# f8 = yD - yA
	mul.s $f9, $f7, $f8		# f9 = (xB-xA)(yD-yA)
	
	sub.s $f7, $f5, $f1		# f7 = xD - xA
	sub.s $f8, $f4, $f2		# f8 = yB - yA
	mul.s $f10, $f7, $f8	# f10 = (xD-xA)(yB-yA)
	
	c.lt.s $f9, $f10 		# if f9 < f10 then flag = true else flag = false
	bc1t cm2				# if flag = true -> cm
	bc1f mc2				# if flag = false ->mc
cm2:
	sub.s $f11, $f10, $f9	# f11 = (xD-xA)(yB-yA) - (xB-xA)(yD-yA)
	j exit2
mc2:
	sub.s $f11, $f9, $f10	# f11 = (xB-xA)(yD-yA) - (xD-xA)(yB-yA)
	j exit2
exit2:
	lwc1 $f12, heso			# load f12 = 2.0
	div.s $f11, $f11, $f12	# f11 = f11 / 2.0
	swc1 $f11, sABD
	

	# S_ACD
	lwc1 $f1, xa
	lwc1 $f2, ya
	lwc1 $f3, xc
	lwc1 $f4, yc
	lwc1 $f5, xd
	lwc1 $f6, yd
	
	#S = 1/2((xC-xA)(yD-yA) - (xD-xA)(yC-yA))
	
	sub.s $f7, $f3, $f1		# f7 = xC - xA
	sub.s $f8, $f6, $f2		# f8 = yD - yA
	mul.s $f9, $f7, $f8		# f9 = (xC-xA)(yD-yA)
	
	sub.s $f7, $f5, $f1		# f7 = xD - xA
	sub.s $f8, $f4, $f2		# f8 = yC - yA
	mul.s $f10, $f7, $f8	# f10 = (xD-xA)(yC-yA)
	
	c.lt.s $f9, $f10 		# if f9 < f10 then flag = true else flag = false
	bc1t cm3				# if flag = true -> cm
	bc1f mc3				# if flag = false ->mc
cm3:
	sub.s $f11, $f10, $f9	# f11 = (xC-xA)(yD-yA) - (xD-xA)(yC-yA)
	j exit3
mc3:
	sub.s $f11, $f9, $f10	# f11 = (xD-xA)(yC-yA) - (xC-xA)(yD-yA)
	j exit3
exit3:
	lwc1 $f12, heso			# load f12 = 2.0
	div.s $f11, $f11, $f12	# f11 = f11 / 2.0
	swc1 $f11, sACD
	
		

	# S_BCD
	lwc1 $f1, xb
	lwc1 $f2, yb
	lwc1 $f3, xc
	lwc1 $f4, yc
	lwc1 $f5, xd
	lwc1 $f6, yd
	
	#S = 1/2|((xC-xB)(yD-yB) - (xD-xB)(yC-yB))|
	
	sub.s $f7, $f3, $f1		# f7 = xC - xB
	sub.s $f8, $f6, $f2		# f8 = yD - yB
	mul.s $f9, $f7, $f8		# f9 = (xC-xB)(yD-yB)
	
	sub.s $f7, $f5, $f1		# f7 = xD - xB
	sub.s $f8, $f4, $f2		# f8 = yC - yB
	mul.s $f10, $f7, $f8	# f10 = (xD-xB)(yC-yB)
	
	c.lt.s $f9, $f10 		# if f9 < f10 then flag = true else flag = false
	bc1t cm4				# if flag = true -> cm
	bc1f mc4				# if flag = false ->mc
cm4:
	sub.s $f11, $f10, $f9	# f11 = (xC-xB)(yD-yB) - (xD-xB)(yC-yB)
	j exit4
mc4:
	sub.s $f11, $f9, $f10	# f11 = (xD-xB)(yC-yB) - (xC-xB)(yD-yB)
	j exit4
exit4:
	lwc1 $f12, heso			# load f12 = 2.0
	div.s $f11, $f11, $f12	# f11 = f11 / 2.0
	swc1 $f11, sBCD
	
	# Load dien tich bon tam giac vao cac thanh ghi f1 -> f4
	lwc1 $f1, sABC
	lwc1 $f2, sABD
	lwc1 $f3, sACD
	lwc1 $f4, sBCD
	
	# Xet truong hop tu giac lom truoc

	# sABC = sABD + sACD + sBCD = $f5
	add.s $f5, $f2, $f3
	add.s $f5, $f5, $f4
	c.eq.s $f1, $f5
	bc1t toABC	# if sABC == $f5 then PC -> toABC
	
	# sABD = sABC + sACD + sBCD = $f5
	add.s $f5, $f1, $f3
	add.s $f5, $f5, $f4
	c.eq.s $f2, $f5
	bc1t toABD	# if sABD == $f5 then PC -> toABD
	
	# sACD = sABC + sABD + sBCD = $f5
	add.s $f5, $f1, $f2
	add.s $f5, $f5, $f4
	c.eq.s $f3, $f5
	bc1t toACD	# if sACD == $f5 then PC -> toACD
	
	# sBCD = sABC + sABD + sACD = $f5
	add.s $f5, $f1, $f2
	add.s $f5, $f5, $f3
	c.eq.s $f4, $f5
	bc1t toBCD	# if sBCD == $f5 then PC -> toBCD
	
	# Neu khong co tam giac nao co dien tich bang tong ba tam giac con lai thi tu giac ABCD la tu giac loi
	bc1f toNo	# PC -> toNO
	
toABC:
	# In ra "Tu giac ABCD la tu giac lom!"
	li $v0, 4
	la $a0, tugiaclom
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	# In ra "Tam giac ABC chua ba tam giac con lai!"
	li $v0, 4
	la $a0, tamgiac
	syscall
	li $v0, 4
	la $a0, abc
	syscall
	li $v0, 4
	la $a0, chua
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	# In ra "Co ba truong hop dien tich cua tu giac: "
	li $v0, 4
	la $a0, bath
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	# TH1:
	li $v0, 4
	la $a0, th1
	syscall
	li $v0, 2
	sub.s $f12, $f1, $f2
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	# TH2:
	li $v0, 4
	la $a0, th2
	syscall
	li $v0, 2
	sub.s $f12, $f1, $f3
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	# TH3:
	li $v0, 4
	la $a0, th3
	syscall
	li $v0, 2
	sub.s $f12, $f1, $f4
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	j toExit
	
toABD:
	li $v0, 4
	la $a0, tugiaclom
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	li $v0, 4
	la $a0, tamgiac
	syscall
	li $v0, 4
	la $a0, abd
	syscall
	li $v0, 4
	la $a0, chua
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	li $v0, 4
	la $a0, bath
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	li $v0, 4
	la $a0, th1
	syscall
	li $v0, 2
	sub.s $f12, $f2, $f1
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	li $v0, 4
	la $a0, th2
	syscall
	li $v0, 2
	sub.s $f12, $f2, $f3
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	li $v0, 4
	la $a0, th3
	syscall
	li $v0, 2
	sub.s $f12, $f2, $f4
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	j toExit
	
toACD:
	li $v0, 4
	la $a0, tugiaclom
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	li $v0, 4
	la $a0, tamgiac
	syscall
	li $v0, 4
	la $a0, acd
	syscall
	li $v0, 4
	la $a0, chua
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	li $v0, 4
	la $a0, bath
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	li $v0, 4
	la $a0, th1
	syscall
	li $v0, 2
	sub.s $f12, $f3, $f1
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	li $v0, 4
	la $a0, th2
	syscall
	li $v0, 2
	sub.s $f12, $f3, $f2
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	li $v0, 4
	la $a0, th3
	syscall
	li $v0, 2
	sub.s $f12, $f3, $f4
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	j toExit
	
toBCD:
	li $v0, 4
	la $a0, tugiaclom
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	li $v0, 4
	la $a0, tamgiac
	syscall
	li $v0, 4
	la $a0, bcd
	syscall
	li $v0, 4
	la $a0, chua
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	li $v0, 4
	la $a0, bath
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	li $v0, 4
	la $a0, th1
	syscall
	li $v0, 2
	sub.s $f12, $f4, $f1
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	li $v0, 4
	la $a0, th2
	syscall
	li $v0, 2
	sub.s $f12, $f4, $f2
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	li $v0, 4
	la $a0, th3
	syscall
	li $v0, 2
	sub.s $f12, $f4, $f3
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	j toExit
	
toNo:
	# Neu tu giac la tu giac loi thi lay dien tich bon tam giac cong lai chia 2
	add.s $f5, $f1, $f2		#f5 = sABC + sABD
	add.s $f5, $f5, $f3		#f5 = sABC + sABD + sACD
	add.s $f5, $f5, $f4		#f5 = sABC + sABD + sACD + sBCD
	div.s $f5, $f5, $f12	# f5 = f5 / 2.0

	li $v0, 4
	la $a0, tugiacloi
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	li $v0, 4
	la $a0, motth
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
	li $v0, 4
	la $a0, ketqua
	syscall
	li $v0, 2
	mov.s $f12, $f5
	syscall
	li $v0, 4
	la $a0, endline
	syscall
	
toExit:
	li $v0, 10
	syscall
