; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+sse2 | FileCheck %s --check-prefix=CHECK --check-prefix=X64
; RUN: llc < %s -mtriple=i386-unknown-unknown -mattr=+sse2 | FileCheck %s --check-prefix=CHECK --check-prefix=X86

define void @test_udiv7_v2i32(<2 x i32>* %x, <2 x i32>* %y) nounwind {
; X64-LABEL: test_udiv7_v2i32:
; X64:       # %bb.0:
; X64-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; X64-NEXT:    pxor %xmm1, %xmm1
; X64-NEXT:    punpckldq {{.*#+}} xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
; X64-NEXT:    movq %xmm0, %rcx
; X64-NEXT:    movabsq $2635249153387078803, %rdi # imm = 0x2492492492492493
; X64-NEXT:    movq %rcx, %rax
; X64-NEXT:    mulq %rdi
; X64-NEXT:    subq %rdx, %rcx
; X64-NEXT:    shrq %rcx
; X64-NEXT:    addq %rdx, %rcx
; X64-NEXT:    shrq $2, %rcx
; X64-NEXT:    movq %rcx, %xmm1
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[2,3,0,1]
; X64-NEXT:    movq %xmm0, %rcx
; X64-NEXT:    movq %rcx, %rax
; X64-NEXT:    mulq %rdi
; X64-NEXT:    subq %rdx, %rcx
; X64-NEXT:    shrq %rcx
; X64-NEXT:    addq %rdx, %rcx
; X64-NEXT:    shrq $2, %rcx
; X64-NEXT:    movq %rcx, %xmm0
; X64-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[0,2,2,3]
; X64-NEXT:    movq %xmm0, (%rsi)
; X64-NEXT:    retq
;
; X86-LABEL: test_udiv7_v2i32:
; X86:       # %bb.0:
; X86-NEXT:    pushl %esi
; X86-NEXT:    subl $40, %esp
; X86-NEXT:    movl {{[0-9]+}}(%esp), %esi
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; X86-NEXT:    movups %xmm0, {{[-0-9]+}}(%e{{[sb]}}p) # 16-byte Spill
; X86-NEXT:    movss %xmm0, (%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    movl $7, {{[0-9]+}}(%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    calll __udivdi3
; X86-NEXT:    movups {{[-0-9]+}}(%e{{[sb]}}p), %xmm0 # 16-byte Reload
; X86-NEXT:    shufps {{.*#+}} xmm0 = xmm0[1,1,0,1]
; X86-NEXT:    movss %xmm0, (%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    movl $7, {{[0-9]+}}(%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu %xmm0, {{[-0-9]+}}(%e{{[sb]}}p) # 16-byte Spill
; X86-NEXT:    calll __udivdi3
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu {{[-0-9]+}}(%e{{[sb]}}p), %xmm1 # 16-byte Reload
; X86-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[0,2,2,3]
; X86-NEXT:    movq %xmm0, (%esi)
; X86-NEXT:    addl $40, %esp
; X86-NEXT:    popl %esi
; X86-NEXT:    retl
  %a = load <2 x i32>, <2 x i32>* %x
  %b = udiv <2 x i32> %a, <i32 7, i32 7>
  store <2 x i32> %b, <2 x i32>* %y
  ret void
}

define void @test_urem7_v2i32(<2 x i32>* %x, <2 x i32>* %y) nounwind {
; X64-LABEL: test_urem7_v2i32:
; X64:       # %bb.0:
; X64-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; X64-NEXT:    pxor %xmm1, %xmm1
; X64-NEXT:    punpckldq {{.*#+}} xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
; X64-NEXT:    movq %xmm0, %rcx
; X64-NEXT:    movabsq $2635249153387078803, %rdi # imm = 0x2492492492492493
; X64-NEXT:    movq %rcx, %rax
; X64-NEXT:    mulq %rdi
; X64-NEXT:    movq %rcx, %rax
; X64-NEXT:    subq %rdx, %rax
; X64-NEXT:    shrq %rax
; X64-NEXT:    addq %rdx, %rax
; X64-NEXT:    shrq $2, %rax
; X64-NEXT:    leaq (,%rax,8), %rdx
; X64-NEXT:    subq %rdx, %rax
; X64-NEXT:    addq %rcx, %rax
; X64-NEXT:    movq %rax, %xmm1
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[2,3,0,1]
; X64-NEXT:    movq %xmm0, %rcx
; X64-NEXT:    movq %rcx, %rax
; X64-NEXT:    mulq %rdi
; X64-NEXT:    movq %rcx, %rax
; X64-NEXT:    subq %rdx, %rax
; X64-NEXT:    shrq %rax
; X64-NEXT:    addq %rdx, %rax
; X64-NEXT:    shrq $2, %rax
; X64-NEXT:    leaq (,%rax,8), %rdx
; X64-NEXT:    subq %rdx, %rax
; X64-NEXT:    addq %rcx, %rax
; X64-NEXT:    movq %rax, %xmm0
; X64-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[0,2,2,3]
; X64-NEXT:    movq %xmm0, (%rsi)
; X64-NEXT:    retq
;
; X86-LABEL: test_urem7_v2i32:
; X86:       # %bb.0:
; X86-NEXT:    pushl %esi
; X86-NEXT:    subl $40, %esp
; X86-NEXT:    movl {{[0-9]+}}(%esp), %esi
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; X86-NEXT:    movups %xmm0, {{[-0-9]+}}(%e{{[sb]}}p) # 16-byte Spill
; X86-NEXT:    movss %xmm0, (%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    movl $7, {{[0-9]+}}(%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    calll __umoddi3
; X86-NEXT:    movups {{[-0-9]+}}(%e{{[sb]}}p), %xmm0 # 16-byte Reload
; X86-NEXT:    shufps {{.*#+}} xmm0 = xmm0[1,1,0,1]
; X86-NEXT:    movss %xmm0, (%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    movl $7, {{[0-9]+}}(%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu %xmm0, {{[-0-9]+}}(%e{{[sb]}}p) # 16-byte Spill
; X86-NEXT:    calll __umoddi3
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu {{[-0-9]+}}(%e{{[sb]}}p), %xmm1 # 16-byte Reload
; X86-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[0,2,2,3]
; X86-NEXT:    movq %xmm0, (%esi)
; X86-NEXT:    addl $40, %esp
; X86-NEXT:    popl %esi
; X86-NEXT:    retl
  %a = load <2 x i32>, <2 x i32>* %x
  %b = urem <2 x i32> %a, <i32 7, i32 7>
  store <2 x i32> %b, <2 x i32>* %y
  ret void
}

define void @test_sdiv7_v2i32(<2 x i32>* %x, <2 x i32>* %y) nounwind {
; X64-LABEL: test_sdiv7_v2i32:
; X64:       # %bb.0:
; X64-NEXT:    movslq (%rdi), %rcx
; X64-NEXT:    movslq 4(%rdi), %rax
; X64-NEXT:    movabsq $5270498306774157605, %rdi # imm = 0x4924924924924925
; X64-NEXT:    imulq %rdi
; X64-NEXT:    movq %rdx, %rax
; X64-NEXT:    shrq $63, %rax
; X64-NEXT:    sarq %rdx
; X64-NEXT:    addq %rax, %rdx
; X64-NEXT:    movq %rdx, %xmm0
; X64-NEXT:    movq %rcx, %rax
; X64-NEXT:    imulq %rdi
; X64-NEXT:    movq %rdx, %rax
; X64-NEXT:    shrq $63, %rax
; X64-NEXT:    sarq %rdx
; X64-NEXT:    addq %rax, %rdx
; X64-NEXT:    movq %rdx, %xmm1
; X64-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[0,2,2,3]
; X64-NEXT:    movq %xmm0, (%rsi)
; X64-NEXT:    retq
;
; X86-LABEL: test_sdiv7_v2i32:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebx
; X86-NEXT:    pushl %edi
; X86-NEXT:    pushl %esi
; X86-NEXT:    subl $16, %esp
; X86-NEXT:    movl {{[0-9]+}}(%esp), %esi
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl (%eax), %edi
; X86-NEXT:    movl 4(%eax), %eax
; X86-NEXT:    movl %edi, %ebx
; X86-NEXT:    sarl $31, %ebx
; X86-NEXT:    movl %eax, %ecx
; X86-NEXT:    sarl $31, %ecx
; X86-NEXT:    pushl $0
; X86-NEXT:    pushl $7
; X86-NEXT:    pushl %ecx
; X86-NEXT:    pushl %eax
; X86-NEXT:    calll __divdi3
; X86-NEXT:    addl $16, %esp
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu %xmm0, (%esp) # 16-byte Spill
; X86-NEXT:    pushl $0
; X86-NEXT:    pushl $7
; X86-NEXT:    pushl %ebx
; X86-NEXT:    pushl %edi
; X86-NEXT:    calll __divdi3
; X86-NEXT:    addl $16, %esp
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu (%esp), %xmm1 # 16-byte Reload
; X86-NEXT:    punpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm1[0]
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,2,2,3]
; X86-NEXT:    movq %xmm0, (%esi)
; X86-NEXT:    addl $16, %esp
; X86-NEXT:    popl %esi
; X86-NEXT:    popl %edi
; X86-NEXT:    popl %ebx
; X86-NEXT:    retl
  %a = load <2 x i32>, <2 x i32>* %x
  %b = sdiv <2 x i32> %a, <i32 7, i32 7>
  store <2 x i32> %b, <2 x i32>* %y
  ret void
}

define void @test_srem7_v2i32(<2 x i32>* %x, <2 x i32>* %y) nounwind {
; X64-LABEL: test_srem7_v2i32:
; X64:       # %bb.0:
; X64-NEXT:    movslq (%rdi), %rcx
; X64-NEXT:    movslq 4(%rdi), %rdi
; X64-NEXT:    movabsq $5270498306774157605, %r8 # imm = 0x4924924924924925
; X64-NEXT:    movq %rdi, %rax
; X64-NEXT:    imulq %r8
; X64-NEXT:    movq %rdx, %rax
; X64-NEXT:    shrq $63, %rax
; X64-NEXT:    sarq %rdx
; X64-NEXT:    addq %rax, %rdx
; X64-NEXT:    leaq (,%rdx,8), %rax
; X64-NEXT:    subq %rax, %rdx
; X64-NEXT:    addq %rdi, %rdx
; X64-NEXT:    movq %rdx, %xmm0
; X64-NEXT:    movq %rcx, %rax
; X64-NEXT:    imulq %r8
; X64-NEXT:    movq %rdx, %rax
; X64-NEXT:    shrq $63, %rax
; X64-NEXT:    sarq %rdx
; X64-NEXT:    addq %rax, %rdx
; X64-NEXT:    leaq (,%rdx,8), %rax
; X64-NEXT:    subq %rax, %rdx
; X64-NEXT:    addq %rcx, %rdx
; X64-NEXT:    movq %rdx, %xmm1
; X64-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[0,2,2,3]
; X64-NEXT:    movq %xmm0, (%rsi)
; X64-NEXT:    retq
;
; X86-LABEL: test_srem7_v2i32:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebx
; X86-NEXT:    pushl %edi
; X86-NEXT:    pushl %esi
; X86-NEXT:    subl $16, %esp
; X86-NEXT:    movl {{[0-9]+}}(%esp), %esi
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl (%eax), %edi
; X86-NEXT:    movl 4(%eax), %eax
; X86-NEXT:    movl %edi, %ebx
; X86-NEXT:    sarl $31, %ebx
; X86-NEXT:    movl %eax, %ecx
; X86-NEXT:    sarl $31, %ecx
; X86-NEXT:    pushl $0
; X86-NEXT:    pushl $7
; X86-NEXT:    pushl %ecx
; X86-NEXT:    pushl %eax
; X86-NEXT:    calll __moddi3
; X86-NEXT:    addl $16, %esp
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu %xmm0, (%esp) # 16-byte Spill
; X86-NEXT:    pushl $0
; X86-NEXT:    pushl $7
; X86-NEXT:    pushl %ebx
; X86-NEXT:    pushl %edi
; X86-NEXT:    calll __moddi3
; X86-NEXT:    addl $16, %esp
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu (%esp), %xmm1 # 16-byte Reload
; X86-NEXT:    punpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm1[0]
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,2,2,3]
; X86-NEXT:    movq %xmm0, (%esi)
; X86-NEXT:    addl $16, %esp
; X86-NEXT:    popl %esi
; X86-NEXT:    popl %edi
; X86-NEXT:    popl %ebx
; X86-NEXT:    retl
  %a = load <2 x i32>, <2 x i32>* %x
  %b = srem <2 x i32> %a, <i32 7, i32 7>
  store <2 x i32> %b, <2 x i32>* %y
  ret void
}

define void @test_udiv_pow2_v2i32(<2 x i32>* %x, <2 x i32>* %y) nounwind {
; X64-LABEL: test_udiv_pow2_v2i32:
; X64:       # %bb.0:
; X64-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; X64-NEXT:    pxor %xmm1, %xmm1
; X64-NEXT:    punpckldq {{.*#+}} xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
; X64-NEXT:    psrlq $3, %xmm0
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,2,2,3]
; X64-NEXT:    movq %xmm0, (%rsi)
; X64-NEXT:    retq
;
; X86-LABEL: test_udiv_pow2_v2i32:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; X86-NEXT:    pxor %xmm1, %xmm1
; X86-NEXT:    punpckldq {{.*#+}} xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
; X86-NEXT:    psrlq $3, %xmm0
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,2,2,3]
; X86-NEXT:    movq %xmm0, (%eax)
; X86-NEXT:    retl
  %a = load <2 x i32>, <2 x i32>* %x
  %b = udiv <2 x i32> %a, <i32 8, i32 8>
  store <2 x i32> %b, <2 x i32>* %y
  ret void
}

define void @test_urem_pow2_v2i32(<2 x i32>* %x, <2 x i32>* %y) nounwind {
; X64-LABEL: test_urem_pow2_v2i32:
; X64:       # %bb.0:
; X64-NEXT:    movl (%rdi), %eax
; X64-NEXT:    movl 4(%rdi), %ecx
; X64-NEXT:    movq %rcx, %xmm0
; X64-NEXT:    movq %rax, %xmm1
; X64-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; X64-NEXT:    pand {{.*}}(%rip), %xmm1
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[0,2,2,3]
; X64-NEXT:    movq %xmm0, (%rsi)
; X64-NEXT:    retq
;
; X86-LABEL: test_urem_pow2_v2i32:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movd {{.*#+}} xmm0 = mem[0],zero,zero,zero
; X86-NEXT:    movd {{.*#+}} xmm1 = mem[0],zero,zero,zero
; X86-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; X86-NEXT:    pand {{\.LCPI.*}}, %xmm1
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[0,2,2,3]
; X86-NEXT:    movq %xmm0, (%eax)
; X86-NEXT:    retl
  %a = load <2 x i32>, <2 x i32>* %x
  %b = urem <2 x i32> %a, <i32 8, i32 8>
  store <2 x i32> %b, <2 x i32>* %y
  ret void
}

define void @test_sdiv_pow2_v2i32(<2 x i32>* %x, <2 x i32>* %y) nounwind {
; X64-LABEL: test_sdiv_pow2_v2i32:
; X64:       # %bb.0:
; X64-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; X64-NEXT:    pxor %xmm1, %xmm1
; X64-NEXT:    punpckldq {{.*#+}} xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
; X64-NEXT:    psrad $31, %xmm1
; X64-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[1,3,2,3]
; X64-NEXT:    pshufd {{.*#+}} xmm2 = xmm0[0,1,1,3]
; X64-NEXT:    punpckldq {{.*#+}} xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
; X64-NEXT:    psrlq $31, %xmm0
; X64-NEXT:    pand {{.*}}(%rip), %xmm0
; X64-NEXT:    psrlq $29, %xmm0
; X64-NEXT:    paddq %xmm2, %xmm0
; X64-NEXT:    psllq $32, %xmm0
; X64-NEXT:    pshufd {{.*#+}} xmm1 = xmm0[1,3,2,3]
; X64-NEXT:    psrad $31, %xmm0
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[1,3,2,3]
; X64-NEXT:    punpckldq {{.*#+}} xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
; X64-NEXT:    psrlq $3, %xmm1
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[0,2,2,3]
; X64-NEXT:    movq %xmm0, (%rsi)
; X64-NEXT:    retq
;
; X86-LABEL: test_sdiv_pow2_v2i32:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; X86-NEXT:    pxor %xmm1, %xmm1
; X86-NEXT:    punpckldq {{.*#+}} xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
; X86-NEXT:    psrad $31, %xmm1
; X86-NEXT:    pshufd {{.*#+}} xmm2 = xmm1[1,3,2,3]
; X86-NEXT:    movdqa %xmm0, %xmm1
; X86-NEXT:    punpckldq {{.*#+}} xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
; X86-NEXT:    shufps {{.*#+}} xmm0 = xmm0[0,1,1,3]
; X86-NEXT:    movdqa {{.*#+}} xmm2 = [0,2147483648,0,2147483648]
; X86-NEXT:    movdqa {{.*#+}} xmm3 = [31,0,31,0]
; X86-NEXT:    movdqa %xmm2, %xmm4
; X86-NEXT:    psrlq %xmm3, %xmm4
; X86-NEXT:    movl $31, %ecx
; X86-NEXT:    movd %ecx, %xmm5
; X86-NEXT:    psrlq %xmm5, %xmm2
; X86-NEXT:    movsd {{.*#+}} xmm2 = xmm4[0],xmm2[1]
; X86-NEXT:    movdqa %xmm1, %xmm4
; X86-NEXT:    psrlq %xmm3, %xmm4
; X86-NEXT:    psrlq %xmm5, %xmm1
; X86-NEXT:    movsd {{.*#+}} xmm1 = xmm4[0],xmm1[1]
; X86-NEXT:    xorpd %xmm2, %xmm1
; X86-NEXT:    psubq %xmm2, %xmm1
; X86-NEXT:    pand {{\.LCPI.*}}, %xmm1
; X86-NEXT:    psrlq $29, %xmm1
; X86-NEXT:    paddq %xmm0, %xmm1
; X86-NEXT:    psllq $32, %xmm1
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[1,3,2,3]
; X86-NEXT:    psrad $31, %xmm1
; X86-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[1,3,2,3]
; X86-NEXT:    punpckldq {{.*#+}} xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
; X86-NEXT:    psrlq $3, %xmm0
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,2,2,3]
; X86-NEXT:    movq %xmm0, (%eax)
; X86-NEXT:    retl
  %a = load <2 x i32>, <2 x i32>* %x
  %b = sdiv <2 x i32> %a, <i32 8, i32 8>
  store <2 x i32> %b, <2 x i32>* %y
  ret void
}

define void @test_srem_pow2_v2i32(<2 x i32>* %x, <2 x i32>* %y) nounwind {
; X64-LABEL: test_srem_pow2_v2i32:
; X64:       # %bb.0:
; X64-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; X64-NEXT:    pxor %xmm1, %xmm1
; X64-NEXT:    punpckldq {{.*#+}} xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
; X64-NEXT:    psrlq $3, %xmm0
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,2,2,3]
; X64-NEXT:    movq %xmm0, (%rsi)
; X64-NEXT:    retq
;
; X86-LABEL: test_srem_pow2_v2i32:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; X86-NEXT:    pxor %xmm1, %xmm1
; X86-NEXT:    punpckldq {{.*#+}} xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
; X86-NEXT:    psrlq $3, %xmm0
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,2,2,3]
; X86-NEXT:    movq %xmm0, (%eax)
; X86-NEXT:    retl
  %a = load <2 x i32>, <2 x i32>* %x
  %b = udiv <2 x i32> %a, <i32 8, i32 8>
  store <2 x i32> %b, <2 x i32>* %y
  ret void
}

define void @test_udiv_v2i32(<2 x i32>* %x, <2 x i32>* %y, <2 x i32>* %z) nounwind {
; X64-LABEL: test_udiv_v2i32:
; X64:       # %bb.0:
; X64-NEXT:    movq %rdx, %rcx
; X64-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; X64-NEXT:    pxor %xmm1, %xmm1
; X64-NEXT:    punpckldq {{.*#+}} xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
; X64-NEXT:    movq {{.*#+}} xmm2 = mem[0],zero
; X64-NEXT:    punpckldq {{.*#+}} xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
; X64-NEXT:    movq %xmm0, %rax
; X64-NEXT:    movq %xmm2, %rsi
; X64-NEXT:    xorl %edx, %edx
; X64-NEXT:    divq %rsi
; X64-NEXT:    movq %rax, %xmm1
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[2,3,0,1]
; X64-NEXT:    movq %xmm0, %rax
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm2[2,3,0,1]
; X64-NEXT:    movq %xmm0, %rsi
; X64-NEXT:    xorl %edx, %edx
; X64-NEXT:    divq %rsi
; X64-NEXT:    movq %rax, %xmm0
; X64-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[0,2,2,3]
; X64-NEXT:    movq %xmm0, (%rcx)
; X64-NEXT:    retq
;
; X86-LABEL: test_udiv_v2i32:
; X86:       # %bb.0:
; X86-NEXT:    pushl %esi
; X86-NEXT:    subl $56, %esp
; X86-NEXT:    movl {{[0-9]+}}(%esp), %esi
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; X86-NEXT:    pxor %xmm1, %xmm1
; X86-NEXT:    movdqa %xmm0, %xmm2
; X86-NEXT:    punpckldq {{.*#+}} xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
; X86-NEXT:    movdqu %xmm2, {{[-0-9]+}}(%e{{[sb]}}p) # 16-byte Spill
; X86-NEXT:    movq {{.*#+}} xmm2 = mem[0],zero
; X86-NEXT:    movdqa %xmm2, %xmm3
; X86-NEXT:    punpckldq {{.*#+}} xmm3 = xmm3[0],xmm1[0],xmm3[1],xmm1[1]
; X86-NEXT:    movd %xmm2, {{[0-9]+}}(%esp)
; X86-NEXT:    movd %xmm0, (%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm3[2,3,0,1]
; X86-NEXT:    movdqu %xmm0, {{[-0-9]+}}(%e{{[sb]}}p) # 16-byte Spill
; X86-NEXT:    calll __udivdi3
; X86-NEXT:    movups {{[-0-9]+}}(%e{{[sb]}}p), %xmm0 # 16-byte Reload
; X86-NEXT:    movss %xmm0, {{[0-9]+}}(%esp)
; X86-NEXT:    movdqu {{[-0-9]+}}(%e{{[sb]}}p), %xmm0 # 16-byte Reload
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[2,3,0,1]
; X86-NEXT:    movd %xmm0, (%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu %xmm0, {{[-0-9]+}}(%e{{[sb]}}p) # 16-byte Spill
; X86-NEXT:    calll __udivdi3
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu {{[-0-9]+}}(%e{{[sb]}}p), %xmm1 # 16-byte Reload
; X86-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[0,2,2,3]
; X86-NEXT:    movq %xmm0, (%esi)
; X86-NEXT:    addl $56, %esp
; X86-NEXT:    popl %esi
; X86-NEXT:    retl
  %a = load <2 x i32>, <2 x i32>* %x
  %b = load <2 x i32>, <2 x i32>* %y
  %c = udiv <2 x i32> %a, %b
  store <2 x i32> %c, <2 x i32>* %z
  ret void
}

define void @test_urem_v2i32(<2 x i32>* %x, <2 x i32>* %y, <2 x i32>* %z) nounwind {
; X64-LABEL: test_urem_v2i32:
; X64:       # %bb.0:
; X64-NEXT:    movq %rdx, %rcx
; X64-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; X64-NEXT:    pxor %xmm1, %xmm1
; X64-NEXT:    punpckldq {{.*#+}} xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
; X64-NEXT:    movq {{.*#+}} xmm2 = mem[0],zero
; X64-NEXT:    punpckldq {{.*#+}} xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
; X64-NEXT:    movq %xmm0, %rax
; X64-NEXT:    movq %xmm2, %rsi
; X64-NEXT:    xorl %edx, %edx
; X64-NEXT:    divq %rsi
; X64-NEXT:    movq %rdx, %xmm1
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[2,3,0,1]
; X64-NEXT:    movq %xmm0, %rax
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm2[2,3,0,1]
; X64-NEXT:    movq %xmm0, %rsi
; X64-NEXT:    xorl %edx, %edx
; X64-NEXT:    divq %rsi
; X64-NEXT:    movq %rdx, %xmm0
; X64-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[0,2,2,3]
; X64-NEXT:    movq %xmm0, (%rcx)
; X64-NEXT:    retq
;
; X86-LABEL: test_urem_v2i32:
; X86:       # %bb.0:
; X86-NEXT:    pushl %esi
; X86-NEXT:    subl $56, %esp
; X86-NEXT:    movl {{[0-9]+}}(%esp), %esi
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movq {{.*#+}} xmm0 = mem[0],zero
; X86-NEXT:    pxor %xmm1, %xmm1
; X86-NEXT:    movdqa %xmm0, %xmm2
; X86-NEXT:    punpckldq {{.*#+}} xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
; X86-NEXT:    movdqu %xmm2, {{[-0-9]+}}(%e{{[sb]}}p) # 16-byte Spill
; X86-NEXT:    movq {{.*#+}} xmm2 = mem[0],zero
; X86-NEXT:    movdqa %xmm2, %xmm3
; X86-NEXT:    punpckldq {{.*#+}} xmm3 = xmm3[0],xmm1[0],xmm3[1],xmm1[1]
; X86-NEXT:    movd %xmm2, {{[0-9]+}}(%esp)
; X86-NEXT:    movd %xmm0, (%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm3[2,3,0,1]
; X86-NEXT:    movdqu %xmm0, {{[-0-9]+}}(%e{{[sb]}}p) # 16-byte Spill
; X86-NEXT:    calll __umoddi3
; X86-NEXT:    movups {{[-0-9]+}}(%e{{[sb]}}p), %xmm0 # 16-byte Reload
; X86-NEXT:    movss %xmm0, {{[0-9]+}}(%esp)
; X86-NEXT:    movdqu {{[-0-9]+}}(%e{{[sb]}}p), %xmm0 # 16-byte Reload
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[2,3,0,1]
; X86-NEXT:    movd %xmm0, (%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    movl $0, {{[0-9]+}}(%esp)
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu %xmm0, {{[-0-9]+}}(%e{{[sb]}}p) # 16-byte Spill
; X86-NEXT:    calll __umoddi3
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu {{[-0-9]+}}(%e{{[sb]}}p), %xmm1 # 16-byte Reload
; X86-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[0,2,2,3]
; X86-NEXT:    movq %xmm0, (%esi)
; X86-NEXT:    addl $56, %esp
; X86-NEXT:    popl %esi
; X86-NEXT:    retl
  %a = load <2 x i32>, <2 x i32>* %x
  %b = load <2 x i32>, <2 x i32>* %y
  %c = urem <2 x i32> %a, %b
  store <2 x i32> %c, <2 x i32>* %z
  ret void
}

define void @test_sdiv_v2i32(<2 x i32>* %x, <2 x i32>* %y, <2 x i32>* %z) nounwind {
; X64-LABEL: test_sdiv_v2i32:
; X64:       # %bb.0:
; X64-NEXT:    movq %rdx, %r8
; X64-NEXT:    movslq (%rdi), %rcx
; X64-NEXT:    movslq 4(%rdi), %rax
; X64-NEXT:    movslq (%rsi), %rdi
; X64-NEXT:    movslq 4(%rsi), %rsi
; X64-NEXT:    cqto
; X64-NEXT:    idivq %rsi
; X64-NEXT:    movq %rax, %xmm0
; X64-NEXT:    movq %rcx, %rax
; X64-NEXT:    cqto
; X64-NEXT:    idivq %rdi
; X64-NEXT:    movq %rax, %xmm1
; X64-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[0,2,2,3]
; X64-NEXT:    movq %xmm0, (%r8)
; X64-NEXT:    retq
;
; X86-LABEL: test_sdiv_v2i32:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    pushl %ebx
; X86-NEXT:    pushl %edi
; X86-NEXT:    pushl %esi
; X86-NEXT:    subl $44, %esp
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movl (%ecx), %edi
; X86-NEXT:    movl %edi, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X86-NEXT:    movl 4(%ecx), %esi
; X86-NEXT:    sarl $31, %edi
; X86-NEXT:    movl %esi, %edx
; X86-NEXT:    sarl $31, %edx
; X86-NEXT:    movl (%eax), %ebx
; X86-NEXT:    movl 4(%eax), %ecx
; X86-NEXT:    movl %ebx, %ebp
; X86-NEXT:    sarl $31, %ebp
; X86-NEXT:    movl %ecx, %eax
; X86-NEXT:    sarl $31, %eax
; X86-NEXT:    pushl %eax
; X86-NEXT:    pushl %ecx
; X86-NEXT:    pushl %edx
; X86-NEXT:    pushl %esi
; X86-NEXT:    calll __divdi3
; X86-NEXT:    addl $16, %esp
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu %xmm0, {{[-0-9]+}}(%e{{[sb]}}p) # 16-byte Spill
; X86-NEXT:    pushl %ebp
; X86-NEXT:    pushl %ebx
; X86-NEXT:    pushl %edi
; X86-NEXT:    pushl {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Folded Reload
; X86-NEXT:    calll __divdi3
; X86-NEXT:    addl $16, %esp
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu {{[-0-9]+}}(%e{{[sb]}}p), %xmm1 # 16-byte Reload
; X86-NEXT:    punpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm1[0]
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,2,2,3]
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movq %xmm0, (%eax)
; X86-NEXT:    addl $44, %esp
; X86-NEXT:    popl %esi
; X86-NEXT:    popl %edi
; X86-NEXT:    popl %ebx
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
  %a = load <2 x i32>, <2 x i32>* %x
  %b = load <2 x i32>, <2 x i32>* %y
  %c = sdiv <2 x i32> %a, %b
  store <2 x i32> %c, <2 x i32>* %z
  ret void
}

define void @test_srem_v2i32(<2 x i32>* %x, <2 x i32>* %y, <2 x i32>* %z) nounwind {
; X64-LABEL: test_srem_v2i32:
; X64:       # %bb.0:
; X64-NEXT:    movq %rdx, %r8
; X64-NEXT:    movslq (%rdi), %rcx
; X64-NEXT:    movslq 4(%rdi), %rax
; X64-NEXT:    movslq (%rsi), %rdi
; X64-NEXT:    movslq 4(%rsi), %rsi
; X64-NEXT:    cqto
; X64-NEXT:    idivq %rsi
; X64-NEXT:    movq %rax, %xmm0
; X64-NEXT:    movq %rcx, %rax
; X64-NEXT:    cqto
; X64-NEXT:    idivq %rdi
; X64-NEXT:    movq %rax, %xmm1
; X64-NEXT:    punpcklqdq {{.*#+}} xmm1 = xmm1[0],xmm0[0]
; X64-NEXT:    pshufd {{.*#+}} xmm0 = xmm1[0,2,2,3]
; X64-NEXT:    movq %xmm0, (%r8)
; X64-NEXT:    retq
;
; X86-LABEL: test_srem_v2i32:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    pushl %ebx
; X86-NEXT:    pushl %edi
; X86-NEXT:    pushl %esi
; X86-NEXT:    subl $44, %esp
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movl (%ecx), %edi
; X86-NEXT:    movl %edi, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X86-NEXT:    movl 4(%ecx), %esi
; X86-NEXT:    sarl $31, %edi
; X86-NEXT:    movl %esi, %edx
; X86-NEXT:    sarl $31, %edx
; X86-NEXT:    movl (%eax), %ebx
; X86-NEXT:    movl 4(%eax), %ecx
; X86-NEXT:    movl %ebx, %ebp
; X86-NEXT:    sarl $31, %ebp
; X86-NEXT:    movl %ecx, %eax
; X86-NEXT:    sarl $31, %eax
; X86-NEXT:    pushl %eax
; X86-NEXT:    pushl %ecx
; X86-NEXT:    pushl %edx
; X86-NEXT:    pushl %esi
; X86-NEXT:    calll __divdi3
; X86-NEXT:    addl $16, %esp
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu %xmm0, {{[-0-9]+}}(%e{{[sb]}}p) # 16-byte Spill
; X86-NEXT:    pushl %ebp
; X86-NEXT:    pushl %ebx
; X86-NEXT:    pushl %edi
; X86-NEXT:    pushl {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Folded Reload
; X86-NEXT:    calll __divdi3
; X86-NEXT:    addl $16, %esp
; X86-NEXT:    movd %eax, %xmm0
; X86-NEXT:    movdqu {{[-0-9]+}}(%e{{[sb]}}p), %xmm1 # 16-byte Reload
; X86-NEXT:    punpcklqdq {{.*#+}} xmm0 = xmm0[0],xmm1[0]
; X86-NEXT:    pshufd {{.*#+}} xmm0 = xmm0[0,2,2,3]
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movq %xmm0, (%eax)
; X86-NEXT:    addl $44, %esp
; X86-NEXT:    popl %esi
; X86-NEXT:    popl %edi
; X86-NEXT:    popl %ebx
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
  %a = load <2 x i32>, <2 x i32>* %x
  %b = load <2 x i32>, <2 x i32>* %y
  %c = sdiv <2 x i32> %a, %b
  store <2 x i32> %c, <2 x i32>* %z
  ret void
}