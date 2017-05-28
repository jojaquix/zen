///////////////////////////
////  Syscall numbers  ////
///////////////////////////

pub const SYS_writeChar = 0;
pub const SYS_createMailbox = 1;
pub const SYS_send = 2;
pub const SYS_receive = 3;


////////////////////
////  Syscalls  ////
////////////////////

pub fn writeChar(char: u8) {
    _ = syscall1(SYS_writeChar, char);
}

pub fn createMailbox(id: u16) {
    _ = syscall1(SYS_createMailbox, id);
}

pub fn send(mailbox_id: u16, data: usize) {
    _ = syscall2(SYS_send, mailbox_id, data);
}

pub fn receive(mailbox_id: u16) -> usize {
    syscall1(SYS_receive, mailbox_id)
}


/////////////////////////
////  Syscall stubs  ////
/////////////////////////

pub inline fn syscall0(number: usize) -> usize {
    asm volatile ("int $0x80"
        : [ret] "={eax}" (-> usize)
        : [number] "{eax}" (number))
}

pub inline fn syscall1(number: usize, arg1: usize) -> usize {
    asm volatile ("int $0x80"
        : [ret] "={eax}" (-> usize)
        : [number] "{eax}" (number),
            [arg1] "{ecx}" (arg1))
}

pub inline fn syscall2(number: usize, arg1: usize, arg2: usize) -> usize {
    asm volatile ("int $0x80"
        : [ret] "={eax}" (-> usize)
        : [number] "{eax}" (number),
            [arg1] "{ecx}" (arg1),
            [arg2] "{edx}" (arg2))
}

pub inline fn syscall3(number: usize, arg1: usize, arg2: usize, arg3: usize) -> usize {
    asm volatile ("int $0x80"
        : [ret] "={eax}" (-> usize)
        : [number] "{eax}" (number),
            [arg1] "{ecx}" (arg1),
            [arg2] "{edx}" (arg2),
            [arg3] "{ebx}" (arg3))
}

pub inline fn syscall4(number: usize, arg1: usize, arg2: usize, arg3: usize, arg4: usize) -> usize {
    asm volatile ("int $0x80"
        : [ret] "={eax}" (-> usize)
        : [number] "{eax}" (number),
            [arg1] "{ecx}" (arg1),
            [arg2] "{edx}" (arg2),
            [arg3] "{ebx}" (arg3),
            [arg4] "{esi}" (arg4))
}

pub inline fn syscall5(number: usize, arg1: usize, arg2: usize, arg3: usize,
    arg4: usize, arg5: usize) -> usize
{
    asm volatile ("int $0x80"
        : [ret] "={eax}" (-> usize)
        : [number] "{eax}" (number),
            [arg1] "{ecx}" (arg1),
            [arg2] "{edx}" (arg2),
            [arg3] "{ebx}" (arg3),
            [arg4] "{esi}" (arg4),
            [arg5] "{edi}" (arg5))
}