// Option: --use-dpcpp-extensions=intel_device_math
#include "cuda_bf16.h"

__global__ void test(long long ll) {
  // Start
  __ll2bfloat16_ru(ll /*long long*/);
  // End
}
