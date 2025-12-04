const char service_interp[] __attribute__((section(".interp"))) = "${LD_SO}";

extern void _exit (int __status) __attribute__ ((__noreturn__));
int main();

void _start() {
#ifdef __x86_64__
    __asm__("andq $-0x10,%rsp");
#elif __i386__
    __asm__("andl $-0x10,%esp");
#else // ARM
   __asm__("and sp, sp, #0xFFFFFFF0");
#endif
    _exit(main());
}
