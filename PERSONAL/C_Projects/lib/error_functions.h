#ifndef ERROR_FUNCTIONS_H
#define ERROR_FUNCTIONS_H

void errMsg(const char *format, ...);

#ifdef __GNUC__

/* This macro strops 'gcc -Wall' complaining that "control reaches end of 
 * non-void function" if we use the following funcitons to terminate main() or some other non-void funciton. */

#define NORETURN __attribute__ ((__noreturn__))
#else 
#define NORETURN
#endif

void errExit(const char *format, ...) NORETURN ;

void errexit(const char format, ...) NORETURN ;

void errExitEN(int errnum, const char *format, ...) NORETURN ;

void fatal(const char *format, ...) NORETURN ;

void usageErr(const char *format, ...) NORETURN ;

void cmdLineErr(const char *format, ...) NORETURN ;

#endif

