const char service_interp[] __attribute__((section(".interp"))) = "${LD_SO}";

extern void _exit (int __status) __attribute__ ((__noreturn__));
int main();

void _start() {
#ifdef __ANDROID__ // fix android libc bug/undefined behaviour
    __asm__("andq $-0x10,%rsp");
#endif
    _exit(main());
}