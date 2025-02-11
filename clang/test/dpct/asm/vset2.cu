// RUN: dpct --format-range=none -out-root %T/asm/vset2 %s --cuda-include-path="%cuda-path/include" -- -std=c++14 -x cuda --cuda-host-only
// RUN: FileCheck %s --match-full-lines --input-file %T/asm/vset2/vset2.dp.cpp
// RUN: %if build_lit %{icpx -c -fsycl  %T/asm/vset2/vset2.dp.cpp -o %T/asm/vset2/vset2.dp.o %}

// clang-format off
__global__ void vset2(unsigned *d) {
  unsigned a, b;
  int e, f;

  // CHECK: *d = dpct::extend_vcompare2<int32_t, int32_t>(e, f, std::equal_to<>());
  // CHECK: *d = dpct::extend_vcompare2<int32_t, int32_t>(e, f, std::not_equal_to<>());
  // CHECK: *d = dpct::extend_vcompare2<int32_t, int32_t>(e, f, std::less<>());
  // CHECK: *d = dpct::extend_vcompare2<int32_t, int32_t>(e, f, std::less_equal<>());
  // CHECK: *d = dpct::extend_vcompare2<int32_t, int32_t>(e, f, std::greater<>());
  // CHECK: *d = dpct::extend_vcompare2<int32_t, int32_t>(e, f, std::greater_equal<>());
  asm("vset2.s32.s32.eq %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(f), "r"(0));
  asm("vset2.s32.s32.ne %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(f), "r"(0));
  asm("vset2.s32.s32.lt %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(f), "r"(0));
  asm("vset2.s32.s32.le %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(f), "r"(0));
  asm("vset2.s32.s32.gt %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(f), "r"(0));
  asm("vset2.s32.s32.ge %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(f), "r"(0));
  
  // CHECK: *d = dpct::extend_vcompare2<uint32_t, int32_t>(a, f, std::equal_to<>());
  // CHECK: *d = dpct::extend_vcompare2<uint32_t, int32_t>(a, f, std::not_equal_to<>());
  // CHECK: *d = dpct::extend_vcompare2<uint32_t, int32_t>(a, f, std::less<>());
  // CHECK: *d = dpct::extend_vcompare2<uint32_t, int32_t>(a, f, std::less_equal<>());
  // CHECK: *d = dpct::extend_vcompare2<uint32_t, int32_t>(a, f, std::greater<>());
  // CHECK: *d = dpct::extend_vcompare2<uint32_t, int32_t>(a, f, std::greater_equal<>());
  asm("vset2.u32.s32.eq %0, %1, %2, %3;" : "=r"(*d) : "r"(a), "r"(f), "r"(0));
  asm("vset2.u32.s32.ne %0, %1, %2, %3;" : "=r"(*d) : "r"(a), "r"(f), "r"(0));
  asm("vset2.u32.s32.lt %0, %1, %2, %3;" : "=r"(*d) : "r"(a), "r"(f), "r"(0));
  asm("vset2.u32.s32.le %0, %1, %2, %3;" : "=r"(*d) : "r"(a), "r"(f), "r"(0));
  asm("vset2.u32.s32.gt %0, %1, %2, %3;" : "=r"(*d) : "r"(a), "r"(f), "r"(0));
  asm("vset2.u32.s32.ge %0, %1, %2, %3;" : "=r"(*d) : "r"(a), "r"(f), "r"(0));

  // CHECK: *d = dpct::extend_vcompare2<int32_t, uint32_t>(e, a, std::equal_to<>());
  // CHECK: *d = dpct::extend_vcompare2<int32_t, uint32_t>(e, a, std::not_equal_to<>());
  // CHECK: *d = dpct::extend_vcompare2<int32_t, uint32_t>(e, a, std::less<>());
  // CHECK: *d = dpct::extend_vcompare2<int32_t, uint32_t>(e, a, std::less_equal<>());
  // CHECK: *d = dpct::extend_vcompare2<int32_t, uint32_t>(e, a, std::greater<>());
  // CHECK: *d = dpct::extend_vcompare2<int32_t, uint32_t>(e, a, std::greater_equal<>());
  asm("vset2.s32.u32.eq %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(a), "r"(0));
  asm("vset2.s32.u32.ne %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(a), "r"(0));
  asm("vset2.s32.u32.lt %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(a), "r"(0));
  asm("vset2.s32.u32.le %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(a), "r"(0));
  asm("vset2.s32.u32.gt %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(a), "r"(0));
  asm("vset2.s32.u32.ge %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(a), "r"(0));

  // CHECK: *d = dpct::extend_vcompare2<uint32_t, uint32_t>(a, b, std::equal_to<>());
  // CHECK: *d = dpct::extend_vcompare2<uint32_t, uint32_t>(a, b, std::not_equal_to<>());
  // CHECK: *d = dpct::extend_vcompare2<uint32_t, uint32_t>(a, b, std::less<>());
  // CHECK: *d = dpct::extend_vcompare2<uint32_t, uint32_t>(a, b, std::less_equal<>());
  // CHECK: *d = dpct::extend_vcompare2<uint32_t, uint32_t>(a, b, std::greater<>());
  // CHECK: *d = dpct::extend_vcompare2<uint32_t, uint32_t>(a, b, std::greater_equal<>());
  asm("vset2.u32.u32.eq %0, %1, %2, %3;" : "=r"(*d) : "r"(a), "r"(b), "r"(0));
  asm("vset2.u32.u32.ne %0, %1, %2, %3;" : "=r"(*d) : "r"(a), "r"(b), "r"(0));
  asm("vset2.u32.u32.lt %0, %1, %2, %3;" : "=r"(*d) : "r"(a), "r"(b), "r"(0));
  asm("vset2.u32.u32.le %0, %1, %2, %3;" : "=r"(*d) : "r"(a), "r"(b), "r"(0));
  asm("vset2.u32.u32.gt %0, %1, %2, %3;" : "=r"(*d) : "r"(a), "r"(b), "r"(0));
  asm("vset2.u32.u32.ge %0, %1, %2, %3;" : "=r"(*d) : "r"(a), "r"(b), "r"(0));

  // CHECK: *d = dpct::extend_vcompare2_add<int32_t, int32_t>(e, f, a, std::equal_to<>());
  // CHECK: *d = dpct::extend_vcompare2_add<int32_t, int32_t>(e, f, a, std::not_equal_to<>());
  // CHECK: *d = dpct::extend_vcompare2_add<int32_t, int32_t>(e, f, a, std::less<>());
  // CHECK: *d = dpct::extend_vcompare2_add<int32_t, int32_t>(e, f, a, std::less_equal<>());
  // CHECK: *d = dpct::extend_vcompare2_add<int32_t, int32_t>(e, f, a, std::greater<>());
  // CHECK: *d = dpct::extend_vcompare2_add<int32_t, int32_t>(e, f, a, std::greater_equal<>());
  asm("vset2.s32.s32.eq.add %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(f), "r"(a));
  asm("vset2.s32.s32.ne.add %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(f), "r"(a));
  asm("vset2.s32.s32.lt.add %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(f), "r"(a));
  asm("vset2.s32.s32.le.add %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(f), "r"(a));
  asm("vset2.s32.s32.gt.add %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(f), "r"(a));
  asm("vset2.s32.s32.ge.add %0, %1, %2, %3;" : "=r"(*d) : "r"(e), "r"(f), "r"(a));
}
