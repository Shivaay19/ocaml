/* Temporary probe for #15272 on Windows CI; not part of the PR. */
#include <stdio.h>
#include <caml/s.h>
#include <caml/mlvalues.h>
#include <caml/alloc.h>

value winprobe_crt(value unit)
{
  (void)unit;
#if defined(_UCRT)
  return caml_copy_string("_UCRT defined");
#else
  return caml_copy_string("_UCRT not defined");
#endif
}

value winprobe_vsnprintf_l(value unit)
{
  (void)unit;
#if defined(HAS_VSNPRINTF_L)
  return caml_copy_string("HAS_VSNPRINTF_L defined");
#else
  return caml_copy_string("HAS_VSNPRINTF_L not defined");
#endif
}
