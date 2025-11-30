# Shared Executable Runtime

A C runtime to staticly link into a shared object to transform it into a "shared executable" - a shared object, that can be run like an executable

## Usage
- build from source or download `crt.o`
- define an `int main(void)` function in some source file
    - `int argc, char* argv[]` are not supported, you can read `/proc/self/cmdline` if you need them
- link your code with `crt.o`, eg. `clang main.c crt.o -o libMain.so`
- It sould be loadable by other programs and run the    `main()` function when

## Compiling
```
make clean
make
```


### Additional options
 - `C_COMPILER=compiler`
 - `C_FLAGS=additional_compiler_flags`
 - `LDSO=custom_path_to_system_linker`

### Note
`./getldso.sh` uses the options passed to `C_FLAGS`, so it detcts things like `-m32` or `--target=armv7-linux-gnueabihf -fuse-ld=lld`, so generally you only need to pass `LDSO`, the script failes to find the system linker in which case the C runtime probably doesn't work anyway

## Support

### Tested
They almost definitly work across all verions
- Linux
- Android

### Untested
They should work but I haven't tested, they may need some bugfixes (you can open an issue)

Sorted from most likely to work to least likly (based on common sense)
- [Free/Open]Bsd
- MacOS
- Any Unix
- Any OS with ELF executables
