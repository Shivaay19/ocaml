/* Temporary probe for #15272 on Windows CI; not part of the PR. */
#include <stdio.h>
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
